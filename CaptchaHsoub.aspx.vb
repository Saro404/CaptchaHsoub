Imports System.Net
Imports System.Net.WebClient
Imports System
Imports System.IO
Imports System.Data
Imports System.Web
Imports System.Web.HttpContext

Public Class CaptchaHsoub
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Sub Submit_Click(sender As Object, e As EventArgs) Handles Submit.Click
        Dim input, challenge, key, language 'القيم التي ترسل لكابتشا حاسوب
        input = System.Web.HttpContext.Current.Request.Form("hcaptcha_input") ' القيمة المدخلة من المستخدم
        challenge = System.Web.HttpContext.Current.Request.Form("hcaptcha_challenge") ' كود challenge أنشئ بواسطة سيرفر كابتشا حسوب.
        key = "" ' Captcha API key,Get one from here: http://captcha.hsoub.com/signup
        language = System.Web.HttpContext.Current.Request.Form("hcaptcha_language") ' لغة كابتشا حسوب.
        'التاكد من القيم بجميع الحقول ليست خالية 
        If (String.IsNullOrEmpty(input) Or String.IsNullOrEmpty(challenge) Or String.IsNullOrEmpty(key) Or String.IsNullOrEmpty(language)) Then
            Label1.Text = "حل CAPTCHA الذي أدخلته خاطئ. يرجى المحاولة مرة أخرى."
        Else
            'تكوين الرابط الذي سيرسل الي سيرفر كابتشا حاسوب
            Dim URL As String = "http://captcha.hsoub.com/api/" & language & "/verify?key=" & key & "&input=" & input & "&challenge=" & challenge & ""

            'GET يرسل الرابط الى سيرفر كابتشا حاسوب 
            Dim request As HttpWebRequest = WebRequest.Create(URL) 'انشئ الرابط
            Dim response As HttpWebResponse = request.GetResponse() 'GET ارسل الرابط الى سيرفر كابتشا حاسوب  
            Dim reader As StreamReader = New StreamReader(response.GetResponseStream()) 'استقبال النتيجة من السيرفر
            'رد سيرفر كابتشا حاسوب بقيمتين
            'true or false 
            'CaptchaResult نخزن الرد بداخل المتغير 
            Dim CaptchaResult As String = reader.ReadLine()
            If (String.Compare(CaptchaResult, "true") = 0) Then
                Label1.Text = "ممتاز! الحل صحيح :)"
                'Do somthing here ...
            Else
                Label1.Text = "حل CAPTCHA الذي أدخلته خاطئ. يرجى المحاولة مرة أخرى."
                'Do somthing here ...
            End If
        End If
      

    End Sub

End Class
