<?php
namespace Common\Lib;

class Jpush_send{
        private $app_key = 'dd14f513a00f91a8e50ebe85';        //待发送的应用程序(appKey)，只能填一个。
        private $master_secret = 'b53f15cdb86589d595d45842';    //主密码
        private $url = "https://api.jpush.cn/v3/push";      //推送的地址
        private $message;
        public function __construct($app_key=null, $master_secret=null,$url=null) {
            if ($app_key) $this->app_key = $app_key;
            if ($master_secret) $this->master_secret = $master_secret;
            if ($url) $this->url = $url;
            $this->message = '';
        }
        public function getMessage(){
            return $this->message;
        }
        public function send_pub($receive,$content,$m_type,$m_txt,$m_time){
           
            $m_time = '86400';//离线保留时间
            $status = false; //存储推送结果
            $result = $this->push($receive,$content,$m_type,$m_txt,$m_time);
            if($result){
                $res_arr = json_decode($result, true);
                if(isset($res_arr['error'])){                       //如果返回了error则证明失败
                    echo $res_arr['error']['message'];          //错误信息
                    $error_code=$res_arr['error']['code'];             //错误码
                        switch ($error_code) {
                            case 200:
                                $status = true;
                                $this->message= '发送成功！';
                                break;
                            case 1000:
                                $this->message= '失败(系统内部错误)';
                                break;
                            case 1001:
                                $this->message = '失败(只支持 HTTP Post 方法，不支持 Get 方法)';
                                break;
                            case 1002:
                                $this->message= '失败(缺少了必须的参数)';
                                break;
                            case 1003:
                                $this->message= '失败(参数值不合法)';
                                break;
                            case 1004:
                                $this->message= '失败(验证失败)';
                                break;
                            case 1005:
                                $this->message= '失败(消息体太大)';
                                break;
                            case 1008:
                                $this->message= '失败(appkey参数非法)';
                                break;
                            case 1020:
                                $this->message= '失败(只支持 HTTPS 请求)';
                                break;
                            case 1030:
                                $this->message= '失败(内部服务超时)';
                                break;
                            default:
                                $this->message= '失败(返回其他状态，目前不清楚额，请联系开发人员！)';
                                break;
                        }
                }else{
                    $status = true;
                    $this->message="发送成功！";
                }
            }else{      
                $this->message='接口调用失败或无响应';
            }
            return $status;
        }

        public function push($receiver='all',$content='',$m_type='',$m_txt='',$m_time='86400'){
            $base64=base64_encode("$this->app_key:$this->master_secret");
            $header=array("Authorization:Basic $base64","Content-Type:application/json");
            $data = array();
            $data['platform'] = 'all';          //目标用户终端手机的平台类型android,ios,winphone
            $data['audience'] = $receiver;      //目标用户
             
            $data['notification'] = array(
                    //统一的模式--标准模式
                    "alert"=>$content,
                     //安卓自定义
                    "android"=>array(
                            "alert"=>$content,
                            "title"=>"",
                            "builder_id"=>1,
                            "extras"=>array("type"=>$m_type, "txt"=>$m_txt)
                    ),
                    //ios的自定义
                    "ios"=>array(
                             "alert"=>$content,
                            "badge"=>"1",
                            "sound"=>"default",
                             "extras"=>array("type"=>$m_type, "txt"=>$m_txt)
                    )
            );
    
            //苹果自定义---为了弹出值方便调测
            $data['message'] = array(
                    "msg_content"=>$content,
                    "extras"=>array("type"=>$m_type, "txt"=>$m_txt)
            );
    
            //附加选项
            $data['options'] = array(
                    "sendno"=>time(),
                    "time_to_live"=>$m_time, //保存离线时间的秒数默认为一天
                    "apns_production"=>false, //布尔类型   指定 APNS 通知发送环境：0开发环境，1生产环境。或者传递false和true
            );
            $param = json_encode($data);
            $res = $this->push_curl($param,$header);
             
            if($res){       //得到返回值--成功已否后面判断
                return $res;
            }else{          //未得到返回值--返回失败
                return false;
            }
        }
    
        //推送的Curl方法
        public function push_curl($param="",$header="") {
            if (empty($param)) { return false; }
            $postUrl = $this->url;
            $curlPost = $param;
            $ch = curl_init();                                      //初始化curl
            curl_setopt($ch, CURLOPT_URL,$postUrl);                 //抓取指定网页
            curl_setopt($ch, CURLOPT_HEADER, 0);                    //设置header
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);            //要求结果为字符串且输出到屏幕上
            curl_setopt($ch, CURLOPT_POST, 1);                      //post提交方式
            curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);
            curl_setopt($ch, CURLOPT_HTTPHEADER,$header);           // 增加 HTTP Header（头）里的字段
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);        // 终止从服务端进行验证
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
            $data = curl_exec($ch);                                 //运行curl
            curl_close($ch);
            return $data;
        }
    
}
?>
