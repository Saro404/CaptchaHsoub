<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CaptchaHsoub.aspx.vb" Inherits="CaptchaHsoub.CaptchaHsoub" %>
   <!-- 
            CAPTCHA Hsoub 
====> 
====> @author: Sara Alsaqer Twitter:Saro_404
====> version 1.0
       Description: vb.net, asp.net client for Hsoub CAPTACHA API
        @hcaptcha_input As String : يحمل مدخلات المستخدم.
        @hcaptcha_challenge: كود challenge أنشئ بواسطة سيرفر كابتشا حسوب.
        @hcaptcha_key: مفتاح API الخاص بك.Get one from here: http://captcha.hsoub.com/signup
        @hcaptcha_language: لغة كابتشا حسوب.
        
       1- يرسل الطلب الى سيرفر  كابتشا حاسوب
       2-  text/plain  ويستقبل الرد من السيرفر من نوع 
           true أو false يحتوي الرد على قيمة 
       

       // Bismillah..
-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Captcha Hsoub</title>
    <!-- Styling -->
    <style>
        #Submit
        {
            -moz-box-shadow: 3px 4px 0px 0px #284470;
            -webkit-box-shadow: 3px 4px 0px 0px #284470;
            box-shadow: 3px 4px 0px 0px #284470;
            background-color: #415989;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            border-radius: 3px;
            border: 1px solid #1f2f47;
            display: inline-block;
            color: #ffffff;
            font-family: tahpma;
            font-size: 13px;
            font-weight: bold;
            padding: 8px 19px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #263666;
        }

            #Submit:hover
            {
                background-color: #516ca3;
            }

            #Submit:active
            {
                position: relative;
                top: 1px;
            }


        form
        {
            border: 1px inset rgba(40, 4, 85, 0.77);
            font: normal 12px tahoma;
            padding: 0;
            margin: 0;
            width: 242px;
            background-color: #F0F0F0;
        }
    </style>
</head>
<body dir="rtl">
    <form id="form1" runat="server" dir="rtl" method="post">
        <div>
            <!-- بداية كود كابشتا حسوب -->
            <script type="text/javascript"><!--
    hcaptcha_options = { language: 'ar', key: 'b7799c839e69bd3c1d232964b6283cbd', background: '#516ca3', border: '#000000' };
    //--></script>
            <script type="text/javascript" src="https://captcha.hsoub.com/hcaptcha.js"></script>
            <!-- نهاية كود كابتشا حسوب -->
        </div>
        <div style="padding: 5px;">
            <p>النتيجة:</p>
            <asp:Label ID="Label1" runat="server" Text="لا توجد نتيجة"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Submit" runat="server" Text="إرسال" Style="" />
            <br />
        </div>
    </form>
</body>
</html>
