Return-Path: <SRS0=8966=UH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,NORMAL_HTTP_TO_IP,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B979C28CC5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Jun 2019 08:02:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19AF6206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Jun 2019 08:02:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="HUFGE1/A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19AF6206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43bf129d;
	Sat, 8 Jun 2019 08:02:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 504319a7
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jun 2019 08:02:30 +0000 (UTC)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e81b069
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jun 2019 08:02:30 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s184so3022008oie.9
 for <wireguard@lists.zx2c4.com>; Sat, 08 Jun 2019 01:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eyxCerSfarmc4zJxEIRNoxNYEdQhpu8CtWm9JBI0A0Q=;
 b=HUFGE1/AF2l0q9tYIjTuWQypVNF6XJSxqvO1myws3WUkxdPo2WZKW7R9NmMBHAxwx/
 XTQONtAHgYm9VCrqmf7s2DENy6alVMnphucV796ophDflhD6g5lpZXoteeo/wbL3X0No
 WBbs6XRZ33rdSzI1EriX+6ndW8jHMpB64J2ARBtJkSGWXUKod66LUsRslT+XwUj1Vbam
 Jv0xH69XijcEFbmZjw1PmFkzNvMuxfEVkB18G8ALqg+kG0xsekqPicrKVvO3obsNpVdq
 DrXqcNH5F2xkzMSIvugUASmtbAatJqnirb7iu3bqk9ns3ekTSLDpNfS7cU+XHHLP54A3
 113Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eyxCerSfarmc4zJxEIRNoxNYEdQhpu8CtWm9JBI0A0Q=;
 b=ETRS764PIq/H9fol3XxKmMsY9kUJAtjxSJ+ITAWILtzn8HcSyygKjz+IV+ySPdgn/E
 yPqBry/Q0nvpjx3xTXxx+OKF4EWITpkLHIP08b3InxgRFJLw5I8pXc90ukW/vToK3lSs
 zt2lQsBiAOV5sNFgtGoJ/XBzmDOw8UcdDeWoLNbt6lG6/QJJ1Xe3QXuotIdw066dY/Ke
 hmHeJ9E/nAOQmEzWa+RcpNEjzrbZDvPj7AAZtea39Su3sSqQ8X5/kQqfcSuvzkar6Ght
 aFXzBoWUCSmcugASv5cHtoG3k9fuIxWcHsGRxV4UNe5uZAWK6Vnk/B77wr39UhW4raJK
 heHg==
X-Gm-Message-State: APjAAAU9l/viAF+hLNzNV86esolCx8c6KSsS9Pv/GpS4lISOWDXLVNa4
 sa4jbtbYPtfUqFztuC1/WAL/V1C01/Jgoan+fsvfOdI1FG8AfA==
X-Google-Smtp-Source: APXvYqyEhZj7PALCv8YKhmPWB1+MDD0WEblLdbdnOo6v0LbSw5HHcmZ+175cW/FfE9cdM9RzltmsBmmUdxzKSXeZBRc=
X-Received: by 2002:aca:ea41:: with SMTP id i62mr2970490oih.144.1559980948831; 
 Sat, 08 Jun 2019 01:02:28 -0700 (PDT)
MIME-Version: 1.0
From: Yeri Tiete <yeri@google.com>
Date: Sat, 8 Jun 2019 16:02:02 +0800
Message-ID: <CAKDvA6JSXfjSUF3iwxorKWW9ogkf-MZtX-A+btTyqEE1++M+ow@mail.gmail.com>
Subject: WireGuard as gateway; excluding private IPs
To: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6772288205377931281=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6772288205377931281==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005ea227058acb5e91"

--0000000000005ea227058acb5e91
Content-Type: multipart/alternative; boundary="000000000000503b41058acb5e58"

--000000000000503b41058acb5e58
Content-Type: text/plain; charset="UTF-8"

This is a personal project after hitting a wall for the Nth time with the
GFW. Where oVPN gets RST or otherwise blocked, it seems WG is still able to
by-pass the firewall.

I was playing around with a couple of devices; routing everything through
WG except for LAN, plus have my devices auto connect no matter where I am.

I can select to exclude private IPs and it'll update 0.0.0.0/0 to include
only public IPs. This seems to be working fine on Android: WG connects,
there's a handshake, traffic gets routed through WG gateway, and I am still
able to connect to my local network devices.

On OSX and iOS on the other hand, once I select *exclude private IPs* the
handshake fails and WG doesn't connect. No traffic gets routed and my
devices can't connect until I turn off WG.

On the other hand -- if I don't select *exclude private IPs,* on iOS and
OSX I can still access LAN IPs just fine -- but on Android that doesn't
work.

In all cases the official app is used.

Any clue why there's a difference? The server address is a public IP.

That being said I seem to be able to make it work -- it's just that the
behaviour is different.

One more thing:

Android doesn't have a feature to connect on-demand the same way iOS and
OSX do. Is this a limitation of Android? Ie I can select it to be
always-on, but the options are not as granular as iOS where I can define to
be on for Cell, WiFi and define the SSIDs.

Thanks,
Yeri Tiete | Corp Ops Engineer | yeri@google.com | +65 9225 0750

--000000000000503b41058acb5e58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is a personal project after hitting a wall for t=
he Nth time with the GFW. Where oVPN gets RST or otherwise blocked, it seem=
s WG is still able to by-pass the firewall.</div><div><br></div><div>I was =
playing around with a couple of devices; routing everything through WG exce=
pt for LAN, plus have my devices auto connect no matter where I am. <br></d=
iv><div><br></div><div>I can select to exclude private IPs and it&#39;ll up=
date <a href=3D"http://0.0.0.0/0">0.0.0.0/0</a> to include only public IPs.=
 This seems to be working fine on Android: WG connects, there&#39;s a hands=
hake, traffic gets routed through WG gateway, and I am still able to connec=
t to my local network devices. <br></div><div><br></div><div>On OSX and iOS=
 on the other hand, once I select <i>exclude private IPs</i> the handshake =
fails and WG doesn&#39;t connect. No traffic gets routed and my devices can=
&#39;t connect until I turn off WG. <br></div><div><br></div><div>On the ot=
her hand -- if I don&#39;t select <i>exclude private IPs,</i> on iOS and OS=
X I can still access LAN IPs just fine -- but on Android that doesn&#39;t w=
ork. <br></div><div><br></div><div>In all cases the official app is used.</=
div><div><br></div><div>Any clue why there&#39;s a difference? The server a=
ddress is a public IP. <br></div><div><br></div><div>That being said I seem=
 to be able to make it work -- it&#39;s just that the behaviour is differen=
t. <br></div><div><br></div><div>One more thing:<br></div><div><br></div><d=
iv>Android doesn&#39;t have a feature to connect on-demand the same way iOS=
 and OSX do. Is this a limitation of Android? Ie I can select it to be alwa=
ys-on, but the options are not as granular as iOS where I can define to be =
on for Cell, WiFi and define the SSIDs. <br></div><div><br></div><div>Thank=
s, <br></div><div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div><div dir=3D"ltr"><div><div style=3D"line-height:1.5em=
;padding-top:10px;margin-top:10px;color:rgb(85,85,85);font-family:sans-seri=
f"><span style=3D"border-top-width:2px;border-right-width:0px;border-bottom=
-width:0px;border-left-width:0px;border-top-style:solid;border-right-style:=
solid;border-bottom-style:solid;border-left-style:solid;border-top-color:rg=
b(213,15,37);border-right-color:rgb(213,15,37);border-bottom-color:rgb(213,=
15,37);border-left-color:rgb(213,15,37);padding-top:2px;margin-top:2px">Yer=
i Tiete |</span><span style=3D"border-top-width:2px;border-right-width:0px;=
border-bottom-width:0px;border-left-width:0px;border-top-style:solid;border=
-right-style:solid;border-bottom-style:solid;border-left-style:solid;border=
-top-color:rgb(51,105,232);border-right-color:rgb(51,105,232);border-bottom=
-color:rgb(51,105,232);border-left-color:rgb(51,105,232);padding-top:2px;ma=
rgin-top:2px">=C2=A0Corp Ops Engineer=C2=A0</span><span style=3D"border-top=
-width:2px;border-right-width:0px;border-bottom-width:0px;border-left-width=
:0px;border-top-style:solid;border-right-style:solid;border-bottom-style:so=
lid;border-left-style:solid;border-top-color:rgb(0,153,57);border-right-col=
or:rgb(0,153,57);border-bottom-color:rgb(0,153,57);border-left-color:rgb(0,=
153,57);padding-top:2px;margin-top:2px">|=C2=A0<a href=3D"mailto:yeri@googl=
e.com" target=3D"_blank">yeri@google.com</a>=C2=A0|</span><span style=3D"bo=
rder-top-width:2px;border-right-width:0px;border-bottom-width:0px;border-le=
ft-width:0px;border-top-style:solid;border-right-style:solid;border-bottom-=
style:solid;border-left-style:solid;border-top-color:rgb(238,178,17);border=
-right-color:rgb(238,178,17);border-bottom-color:rgb(238,178,17);border-lef=
t-color:rgb(238,178,17);padding-top:2px;margin-top:2px">=C2=A0+65 9225 0750=
</span></div></div></div></div></div></div></div></div></div></div></div></=
div></div></div>

--000000000000503b41058acb5e58--

--0000000000005ea227058acb5e91
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIS4wYJKoZIhvcNAQcCoIIS1DCCEtACAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghBJMIIEXDCCA0SgAwIBAgIOSBtqDm4P/739RPqw/wcwDQYJKoZIhvcNAQELBQAwZDELMAkGA1UE
BhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExOjA4BgNVBAMTMUdsb2JhbFNpZ24gUGVy
c29uYWxTaWduIFBhcnRuZXJzIENBIC0gU0hBMjU2IC0gRzIwHhcNMTYwNjE1MDAwMDAwWhcNMjEw
NjE1MDAwMDAwWjBMMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEiMCAG
A1UEAxMZR2xvYmFsU2lnbiBIViBTL01JTUUgQ0EgMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBALR23lKtjlZW/17kthzYcMHHKFgywfc4vLIjfq42NmMWbXkNUabIgS8KX4PnIFsTlD6F
GO2fqnsTygvYPFBSMX4OCFtJXoikP2CQlEvO7WooyE94tqmqD+w0YtyP2IB5j4KvOIeNv1Gbnnes
BIUWLFxs1ERvYDhmk+OrvW7Vd8ZfpRJj71Rb+QQsUpkyTySaqALXnyztTDp1L5d1bABJN/bJbEU3
Hf5FLrANmognIu+Npty6GrA6p3yKELzTsilOFmYNWg7L838NS2JbFOndl+ce89gM36CW7vyhszi6
6LqqzJL8MsmkP53GGhf11YMP9EkmawYouMDP/PwQYhIiUO0CAwEAAaOCASIwggEeMA4GA1UdDwEB
/wQEAwIBBjAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwEgYDVR0TAQH/BAgwBgEB/wIB
ADAdBgNVHQ4EFgQUyzgSsMeZwHiSjLMhleb0JmLA4D8wHwYDVR0jBBgwFoAUJiSSix/TRK+xsBtt
r+500ox4AAMwSwYDVR0fBEQwQjBAoD6gPIY6aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9ncy9n
c3BlcnNvbmFsc2lnbnB0bnJzc2hhMmcyLmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIG
CCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG
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
--0000000000005ea227058acb5e91--

--===============6772288205377931281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6772288205377931281==--
