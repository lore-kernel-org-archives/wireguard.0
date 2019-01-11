Return-Path: <SRS0=OwtD=PT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_FACE_BAD,HTML_IMAGE_RATIO_08,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBAAC43612
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jan 2019 08:09:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67B9D20872
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jan 2019 08:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=temperror (0-bit key) header.d=oregonvc.com header.i=@oregonvc.com header.b="V0tIo7/m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67B9D20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=oregonvc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e15280f;
	Fri, 11 Jan 2019 08:05:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a27c279
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 04:40:17 +0000 (UTC)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86feeb24
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 04:40:17 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id n32so16995145qte.11
 for <wireguard@lists.zx2c4.com>; Thu, 10 Jan 2019 20:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oregonvc.com; s=google;
 h=from:to:subject:message-id:date:delivered-to:mime-version;
 bh=3VzllHayoLRu1b87LGKmXRRDkuAbay6zLVNEkmoYw2c=;
 b=V0tIo7/muTKNExn6LXJTAERncUOfL2xKFQibfukupK1xlfuhVZY/ZShSdYXj7mpZbx
 p9hIjiavvzU5cAwvDvASi1YgoJjQmh0qx5YxaOyNOteRBfyiboIXBdWRFVojQK7mxsFa
 9HQHHTS5sPS8vQqohNgJVJMhrly7ZBkZ+ddezjEfi2AgNLRUa7Eu/LhhWDezANR3Civh
 FiyRar+D6tMj18rv7osM2INeV67UVHifbdbR7JxqENKsiuvv+jHk43Bub1x4MnbCEG4e
 ifGzLJ/xBZFHfs2zqtsIVrhyxZQ9pA4VJ7uIC/tJngLHkTXwuonvnXp3mpKaY52EvKYI
 ZUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:message-id:date:delivered-to
 :mime-version;
 bh=3VzllHayoLRu1b87LGKmXRRDkuAbay6zLVNEkmoYw2c=;
 b=MIAoCII07rDt0IsbrqqtOyIzqTJMhFxPMDe/ryLAjZbfoaT8OqHYdtreIP5cjqENCV
 k29nYUeyaHf6g6fXhmuJm/kEPu6jPN9l+UsmQrlK8Yh3yal6CFm52zvOmyjJ0lQw7m+4
 sIsVvrd3VscTuSyA0lPbw0C6WqkfjAAcqOlDWi5AkihCR0uNWjKyIAGT5rjWFBiszOdO
 GNvACmWkWJ3aJnANWEUwADMXfBkiBG+RKKA0Otjp6tFamqe3TCq/CPwvr3/OtXq7OUgq
 PwwmvxyIkNbluRlwzn6C0tRFKB/D5p7pjY1P+2acpUPCzU/ZaFM6CDg0kajxMS2BkKBu
 BF3g==
X-Gm-Message-State: AJcUukdGkUDf9R33iRnIL3JrUKoDDHsDD9JleuX4vrYLqfa+ds66E3ip
 MZrxiy2biPrBriGI/5WlyDIngrAlZJE=
X-Google-Smtp-Source: ALg8bN4R8IkXTTG8HQ6PfrCFM1Ry8cjac+cgwfq6wk7TZDFeas0Edprgze2aaVcBfLvV7T++C1/JnA==
X-Received: by 2002:aed:34e6:: with SMTP id x93mr12689330qtd.156.1547181825673; 
 Thu, 10 Jan 2019 20:43:45 -0800 (PST)
Received: from [127.0.0.1] (send-12.prod.mixmax-mailer.com. [52.200.39.124])
 by smtp.gmail.com with ESMTPSA id s46sm42921686qtc.63.2019.01.10.20.43.45
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Jan 2019 20:43:45 -0800 (PST)
From: Matt Abrams <matt@oregonvc.com>
To: wireguard@lists.zx2c4.com
Subject: Wireguard iOS issue...disconnects wifi and reverts to LTE / VPN
Message-Id: <cf7e3c5c-3be7-7e07-e89b-5beba6dd5453@mixmax.com>
Date: Fri, 11 Jan 2019 04:43:42 +0000
X-Mixmax-Message-Id: vfTvacR245k9px99i
X-Mailer: Mixmax (mixmax.com)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 11 Jan 2019 09:05:47 +0100
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
Content-Type: multipart/mixed; boundary="===============2823681274387264525=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2823681274387264525==
Content-Type: multipart/alternative;
 boundary="----sinikael-?=_1-15471818252740.5619928650490229"

------sinikael-?=_1-15471818252740.5619928650490229
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

With latest Testflight (and every version of Wireguard on latest iOS), most=
 WG
connections will connect, but in the process disconnect the wifi and =
revert to
LTE.=C2=A0 It is not consistent as to how or when it happens - it=
 will sometimes
remain connected to wifi. Have tried with Algo servers on =
AWS, DO as well as
Mullvad connections=E2=80=A6
------sinikael-?=_1-15471818252740.5619928650490229
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www=
.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html xmlns=3D"http://www.=
w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office"> <head> <meta =
name=3D"viewport" content=3D"width=3Ddevice-width,initial-scale=3D1"> <!=
--[if gte mso 9]>
    <xml>
      <o:OfficeDocumentSettings>
        <o:AllowPNG/>
        <o:PixelsPerInch>96</o:PixelsPerInch>
     </o:OfficeDocumentSettings>
    </xml>
    <![endif]--> <style =
type=3D"text/css">* a:hover{cursor:pointer;}</style> <style>body =
{-webkit-animation:bugfix infinite 1s;}@-webkit-keyframes bugfix {from =
{position:relative;}to {position:relative;}}</style> </head> <body =
style=3D"word-wrap:normal;word-break:break-word"> <style>a =
{word-wrap:normal;word-break:break-word;}.background-contain =
{background-size:contain;}@media only screen and (max-width:600px) {.=
container {-webkit-text-size-adjust:none !important;}.container,.=
palm-one-whole {width:100% !important;min-width:100% !important;}.=
palm-one-half {width:50% !important;min-width:50% !important;box-sizing:bor=
der-box;}blockquote .container,blockquote .container div,blockquote .=
container table {width:auto !important;min-width:0 !=
important;position:relative !important;}img {max-width:100%;}.border-outer,=
.border-middle,.border-inner,.inner,[title=3D"separator"] {width:100% !=
important;}.innercell {padding:8px !important;}.palm-block {display:block !=
important;}td.palm-one-whole {display:inline-block !important;padding:0;}td=
.palm-one-whole:first-child:not(:only-child) {margin-bottom:16px;}td.=
hostname {padding-top:3px !important;}}@media only screen and =
(min-width:601px) {.preview-card {max-width:600px !important;}}@media only =
screen and (min-device-width :320px) and (max-device-width :568px),only =
screen and (min-device-width :768px) and (max-device-width :1024px),only =
screen and (max-device-width:640px),only screen and =
(max-device-width:667px),only screen and (max-width:480px){.container =
{width:100% !important;min-width:100% !important;}.p,.small,li,=
font[size=3D"2"],font[size=3D"3"] {font-size:1em !important;}}@media only =
screen and (min-device-width :320px) and (max-device-width :568px),only =
screen and (min-device-width :768px) and (max-device-width :1024px),only =
screen and (min-device-width :1224px)  {.message-wrapper {padding-top:6px;}=
.apple-only[style] {display:block !important;max-height:none !=
important;line-height:normal !important;overflow:visible !=
important;height:auto !important;width:100% !important;position:relative !=
important;}.no-apple {display:none !important;}form =
{font-size:inherit;}input[type=3D"text"] {height:43px;padding-left:4px !=
important;}button:hover {cursor:pointer;}}@media only screen and =
(min-device-width :1224px)  {.apple-mail-form {display:block !=
important;background-color:white !important;}}* [office365] .=
outlook-com-hidden {display:none !important;}* [office365] .=
outlook-com-button {display:block;}* [office365] .outlook-com-only =
{display:block !important;max-height:none !important;line-height:normal !=
important;overflow:visible !important;height:auto !important;width:100% !=
important;position:relative !important;}.ExternalClass {width:100%;}.=
ExternalClass .outlook-com-button {display:block;}.ExternalClass button =
{height:auto;}.ExternalClass .outlook-com-hidden {display:none !important;}=
.ExternalClass .outlook-com-only {display:block !important;max-height:none =
!important;line-height:normal !important;overflow:visible !=
important;height:auto !important;width:100% !important;position:relative !=
important;}.ExternalClass .ecxlabels {display:none !important;}.=
ExternalClass .ecxlabels {display:none !important;}.ExternalClass .ecxarrow=
 {display:none !important;}.ExternalClass cite >div + div {padding:0 0 4px =
0;}.ExternalClass .h1 {padding-bottom:5px;}.ExternalClass .h2 =
{padding-bottom:5px;}.ExternalClass .h3 {padding-bottom:5px;}.ExternalClass=
 [lang=3D"brand-pinterest"] {width:280px !important;}</style> <!--[if (gte =
mso 9)|(IE)]>
   =20
    <style>
      a, body {
        font-family: =
'Calibri', Arial, sans-serif;
      }
   =20
      img {
        border: none !important;
        -ms-interpolation-mode:bicubic;
      }
   =20
      td {
        mso-line-height-rule:exactly !important;
      }
   =20
      .mso-card-inner table {
        border-collapse: =
collapse !important;
        mso-table-lspace:0pt;
        =
mso-table-rspace:0pt;
        vertical-align: top;
      }
   =20
      .outlook-com-only {
        display: none !important;
        font-size: 0 !important;
      }
   =20
      #mso-one-whole {
        width: 100% !important;
      }
   =20
   =20
   =20
        .border-outer,
        .border-middle,
        .border-inner {
          border: none !important;
        }
   =20
        .border-middle,
        .border-inner {
          width: 100% !important;
        }
   =20
        .mso-border-outer,
        .mso-border-middle,
        .mso-border-inner {
          padding: 1px;
        }
   =20
        .mso-border-outer { background-color: rgb(245, 255, 255); }
        .mso-border-middle { background-color: rgb(223, 246, 255); }
        .mso-border-inner { background-color: rgb(153, 176, 225); }
   =20
    </style>
   =20
    <![endif]--> <table class=3D"container" =
lang=3D"container" dir=3D"ltr" border=3D"0" cellpadding=3D"0" =
cellspacing=3D"0" valign=3D"top" style=3D"width:100%;margin-top:6px"> <tr> =
<td valign=3D"top" class=3D"message-wrapper" style=3D"line-height:1.=
31;color:#222;font-family:arial,sans-serif"> <!--[if mso]><table =
width=3D"590" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" =
valign=3D"top" style=3D"width:590px;border-collapse:separate;"><tr><td =
valign=3D"top"><![endif]--> <div style=3D"max-width:590px"><font =
face=3D"'proxima-nova', 'Avenir Next', 'Segoe UI', 'Calibri', 'Helvetica =
Neue', Helvetica, Arial, sans-serif">With latest Testflight (and every =
version of Wireguard on latest iOS), most WG connections will connect, but =
in the process disconnect the wifi and revert to LTE.=C2=A0 It is not =
consistent as to how or when it happens - it will sometimes remain =
connected to wifi. Have tried with Algo servers on AWS, DO as well as =
Mullvad connections=E2=80=A6</font></div><div class=3D"mixmax_signature" =
style=3D"max-width:590px"><div style=3D"max-width:590px"></div></div><img =
align=3D"left" width=3D"0" height=3D"0" style=3D"border:0;width:0px;height:=
0px" src=3D"https://track.mixmax.com/api/track/v2/vfTvacR245k9px99i/gIt92Yu=
Mmdu92ZlJ3bARHdh1mI/i02bj5CNjJDe65yc0NXasBEZyFWdnVmcpdnI/?sc=3Dfalse" =
alt=3D""> <!--[if mso]></td></tr></table><![endif]--> </td> </tr> </table> =
</body> </html>=20
------sinikael-?=_1-15471818252740.5619928650490229--

--===============2823681274387264525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2823681274387264525==--
