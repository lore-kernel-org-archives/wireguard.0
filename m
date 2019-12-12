Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4538CC2D0CB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 09:54:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC2E8214AF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 09:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="ZrE7io9i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC2E8214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a54ebae;
	Thu, 12 Dec 2019 09:54:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac99d09c
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 09:28:05 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [213.250.55.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a6e1c58
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 09:28:05 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id B0D1E1002FC0; Thu, 12 Dec 2019 10:28:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1576142883;
 bh=xu8QKfSrcqKB9mTT9hnOydDYATAx3QTyHGk5+KqDfK8=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=ZrE7io9iJEED7Xk4KCRrQnEQGdRkZTQ/SxTOVWGT3KEETu6IQvuvltt+fMLXYQkHM
 Kc9VX1NXGzZB5XZzcjnonQamx35YwA4Ej10350oiIhUzoBsRgOG7kxe2Sd9pbNPReA
 h7ov9REa7mjmMzclDNlEVGE4EW4a2EirqEaWBSpY=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id 1418E1002FB6;
 Thu, 12 Dec 2019 10:28:01 +0100 (CET)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0468.000; Thu, 12 Dec 2019 10:28:01 +0100
From: Simon Rozman <simon@rozman.si>
To: Richard Reiner <rreiner3@yahoo.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: Windows client "Unable to create Wintun device"
Thread-Topic: Windows client "Unable to create Wintun device"
Thread-Index: AQHVpQaeuMfCEytYcUucwligrjF2Eae2T7Qg
Date: Thu, 12 Dec 2019 09:28:00 +0000
Message-ID: <99D61A626FDA8A4B90A270669121BE10D0597A0F@PLANJAVA.amebis.doma>
References: <2078146812.1909563.1573533502212.ref@mail.yahoo.com>
 <2078146812.1909563.1573533502212@mail.yahoo.com>
In-Reply-To: <2078146812.1909563.1573533502212@mail.yahoo.com>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [2a00:ee2:209:164::1]
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Dec 2019 10:54:32 +0100
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
Content-Type: multipart/mixed; boundary="===============6778128274354246712=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6778128274354246712==
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=2.16.840.1.101.3.4.2.1;
	boundary="----=_NextPart_000_0029_01D5B0D6.D3724930"

------=_NextPart_000_0029_01D5B0D6.D3724930
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_002A_01D5B0D6.D3724930"


------=_NextPart_001_002A_01D5B0D6.D3724930
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

=20

I apologise for the delay. (Becoming my standard letter introduction =
these days. =E2=98=B9)

=20

Your error is saying that NetCfgInstanceId value did not appear in the =
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-=
11ce-bfc1-08002be10318}\<id> registry key in 10 seconds. Can you check =
the registry key what's going on there, please?

=20

Also, check the event log (System and Application and Service =
Logs\Microsoft\Windows\DeviceSetupManager) for any errors at the time =
you are attempting to activate the tunnel. Maybe there's some disabled =
service causing interface device creation to fail?

=20

Maybe your Windows is attempting to access Windows Update for a newer =
version of Wintun driver first, triggering 10 second timeout in =
WireGuard?

=20

Best regards,

Simon

=20

From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Richard =
Reiner
Sent: Tuesday, November 12, 2019 5:38 AM
To: wireguard@lists.zx2c4.com
Subject: Windows client "Unable to create Wintun device"

=20

On one of my machines, the Wireguard Windows client 0.0.35 was =
previously working well, but as of today whenever attempting to activate =
any tunnel it generates errors with log messages like:

=20

  2019-11-11 17:32:48.033: [TUN] [tun22] Unable to create Wintun device: =
Unable to create Wintun interface: GetStringValueWait(NetCfgInstanceId) =
failed: Timeout waiting for registry value

=20

An uninstall - reboot - reinstall has not corrected this/

=20

The affected machine has received some Windows 10 updates recently as =
well as a VMware Player update.

But another machine with the same software installed works fine.

=20

Any thoughts or suggestions?

=20

=20


------=_NextPart_001_002A_01D5B0D6.D3724930
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
code
	{mso-style-priority:99;
	font-family:Consolas;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DSL =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>Hi Richard,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>I apologise for the delay. =
(Becoming my standard letter introduction these days. </span><span =
lang=3DEN-GB style=3D'font-family:"Segoe UI =
Emoji",sans-serif;mso-fareast-language:EN-US'>=E2=98=B9</span><span =
lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>Your error is saying that =
</span><code><span lang=3DEN-GB =
style=3D'font-size:10.0pt;mso-fareast-language:EN-US'>NetCfgInstanceId</s=
pan></code><span lang=3DEN-GB style=3D'mso-fareast-language:EN-US'> =
value did not appear in the HKEY</span><code><span lang=3DEN-GB =
style=3D'font-size:10.0pt;mso-fareast-language:EN-US'>_LOCAL_MACHINE\SYST=
EM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}=
\<i>&lt;id&gt;</i></span></code><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'> registry key in 10 seconds. Can =
you check the registry key what's going on there, =
please?<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>Also, check the event log (System =
and Application and Service Logs\Microsoft\Windows\DeviceSetupManager) =
for any errors at the time you are attempting to activate the tunnel. =
Maybe there's some disabled service causing interface device creation to =
fail?<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>Maybe your Windows is attempting to =
access Windows Update for a newer version of Wintun driver first, =
triggering 10 second timeout in WireGuard?<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><div><p =
class=3DMsoNormal>Best regards,<o:p></o:p></p><p =
class=3DMsoNormal>Simon<o:p></o:p></p></div><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt'><div><div style=3D'border:none;border-top:solid #E1E1E1 =
1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal><b><span =
lang=3DEN-GB>From:</span></b><span lang=3DEN-GB> WireGuard =
&lt;wireguard-bounces@lists.zx2c4.com&gt; <b>On Behalf Of </b>Richard =
Reiner<br><b>Sent:</b> Tuesday, November 12, 2019 5:38 AM<br><b>To:</b> =
wireguard@lists.zx2c4.com<br><b>Subject:</b> Windows client &quot;Unable =
to create Wintun device&quot;<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><div><div><div><div><div><div><d=
iv style=3D'margin-top:6.0pt'><div><div><div><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'>O=
n one of my machines, the Wireguard Windows client 0.0.35 was =
previously&nbsp;working well, but as of today whenever attempting to =
activate any tunnel it generates errors with log messages =
like:<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'><=
o:p>&nbsp;</o:p></span></p></div><div><div><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'>&=
nbsp; 2019-11-11 17:32:48.033: [TUN] [tun22] Unable to create Wintun =
device: Unable to create Wintun interface: =
GetStringValueWait(NetCfgInstanceId) failed: Timeout waiting for =
registry value<o:p></o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'><=
o:p>&nbsp;</o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'>A=
n uninstall - reboot - reinstall has not corrected =
this/<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'><=
o:p>&nbsp;</o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'>T=
he affected machine has received some Windows 10 updates recently as =
well as a VMware Player update.<o:p></o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'>B=
ut another machine with the same software installed works =
fine.<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'><=
o:p>&nbsp;</o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'>A=
ny thoughts&nbsp;or suggestions?<o:p></o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif;color:#222222'><=
o:p>&nbsp;</o:p></span></p></div></div></div></div></div></div></div></di=
v></div><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:12.0pt;font-family:"Helvetica",sans-serif'><o:p>&nbsp;=
</o:p></span></p></div></div></div></div></body></html>
------=_NextPart_001_002A_01D5B0D6.D3724930--

------=_NextPart_000_0029_01D5B0D6.D3724930
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
AwMwJzAlBggrBgEFBQcCARYZaHR0cDovL3d3dy5jYS5nb3Yuc2kvY3BzLzAIBgYEAIswAQIwGAYI
KwYBBQUHAQMEDDAKMAgGBgQAjkYBATAaBgNVHREEEzARgQ9zaW1vbkByb3ptYW4uc2kwge4GA1Ud
HwSB5jCB4zBWoFSgUqRQME4xCzAJBgNVBAYTAnNpMRswGQYDVQQKExJzdGF0ZS1pbnN0aXR1dGlv
bnMxETAPBgNVBAsTCHNpZ2VuLWNhMQ8wDQYDVQQDEwZDUkw0NTUwgYiggYWggYKGV2xkYXA6Ly94
NTAwLmdvdi5zaS9vdT1zaWdlbi1jYSxvPXN0YXRlLWluc3RpdHV0aW9ucyxjPXNpP2NlcnRpZmlj
YXRlUmV2b2NhdGlvbkxpc3Q/YmFzZYYnaHR0cDovL3d3dy5zaWdlbi1jYS5zaS9jcmwvc2lnZW4t
Y2EuY3JsMCsGA1UdEAQkMCKADzIwMTYwMjE5MTc1NDQxWoEPMjAyMTAyMTkyMTM4MTVaMB8GA1Ud
IwQYMBaAFHF7igYfMQVVq2ASd0cgHgOIGOyJMB0GA1UdDgQWBBS7/7AHyQYI0e8GOPmwTc1ZTNw5
lzAJBgNVHRMEAjAAMBkGCSqGSIb2fQdBAAQMMAobBFY4LjEDAgOoMA0GCSqGSIb3DQEBBQUAA4IB
AQBBUL4KG1Z1oBIIdKIZs9yJxnJg/LfEPVvzNH8+CCqegq0D6k48Doo72oVEiskjqggdbUGj30uA
H8PjCD5kLGVoDwh5a2atQ3qQzaYA/lj2Js2f4fdXNn60vRp7XzbGsQdwYYecIrKzO5x6XVAIRb+T
HZNjXL3VX6vOozwBQv/+dx1P9H/rMUn7d8ci7v4PeqShbWbWwi6ez19cZvSKSkz/lWf4tj8QbA0n
WeUBlk3Bx6/TRda7kwXzcFExt+ROGt0YJjbZCN3kd7swcRvRT6gEi9L6n1XLghwPSYhzZjaL5fXv
I11JuSoQCy13XWBkq35Moo4iY19wanS1W6UM8Yq0MIIF5TCCBE2gAwIBAgINAKZovVEAAAAAVx3Q
6DANBgkqhkiG9w0BAQsFADBcMQswCQYDVQQGEwJTSTEcMBoGA1UEChMTUmVwdWJsaWthIFNsb3Zl
bmlqYTEXMBUGA1UEYRMOVkFUU0ktMTc2NTk5NTcxFjAUBgNVBAMTDVNJLVRSVVNUIFJvb3QwHhcN
MTYwNTI0MTE1ODI3WhcNMjEwNjI3MjIwMDAwWjA9MQswCQYDVQQGEwJzaTEbMBkGA1UEChMSc3Rh
dGUtaW5zdGl0dXRpb25zMREwDwYDVQQLEwhzaWdlbi1jYTCCASIwDQYJKoZIhvcNAQEBBQADggEP
ADCCAQoCggEBALDlZbLArGSW8ogbs+2e5ALGTyuIzi6KUYB1rxBb8ss4ZpuiDm00R5alkhGv9jVH
onciDM4WiGKq00luGLwuRNi+xp7CGhmsQY78MAcC8sZq1FsjAO9BNNikc2PfIpIzhAGljfODXPq4
1Ho13+z4bQ/gTO2tnDp9htalCJS+fXoRH/6FP1RaiGOHnKWxp07Nt0Rzr8+KSWsf483XSU1aKxfm
XHazu3K5byfSm4kViN8QX3YhAWrHFTEK0ZxY+CgWBW3ZTtmh1wcgy0smiU2Ssqe6lujjWI8inAGW
WsT3MU0LSbXheGHiVBgGu55UNH4MPuvutYAf3RaEHWg4Zmdz+JECAwEAAaOCAkMwggI/MBIGA1Ud
EwEB/wQIMAYBAf8CAQAwDgYDVR0PAQH/BAQDAgEGMDoGA1UdIAQzMDEwLwYEVR0gADAnMCUGCCsG
AQUFBwIBFhlodHRwOi8vd3d3LmNhLmdvdi5zaS9jcHMvMGkGCCsGAQUFBwEBBF0wWzA2BggrBgEF
BQcwAoYqaHR0cDovL3d3dy5jYS5nb3Yuc2kvY3J0L3NpLXRydXN0LXJvb3QuY3J0MCEGCCsGAQUF
BzABhhVodHRwOi8vb2NzcC5jYS5nb3Yuc2kwHQYDVR0OBBYEFHF7igYfMQVVq2ASd0cgHgOIGOyJ
MIIBPAYDVR0fBIIBMzCCAS8wgbeggbSggbGGKmh0dHA6Ly93d3cuY2EuZ292LnNpL2NybC9zaS10
cnVzdC1yb290LmNybIaBgmxkYXA6Ly94NTAwLmdvdi5zaS9jbj1TSS1UUlVTVCUyMFJvb3Qsb3Jn
YW5pemF0aW9uSWRlbnRpZmllcj1WQVRTSS0xNzY1OTk1NyxvPVJlcHVibGlrYSUyMFNsb3Zlbmlq
YSxjPVNJP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Qwc6BxoG+kbTBrMQswCQYDVQQGEwJTSTEc
MBoGA1UEChMTUmVwdWJsaWthIFNsb3ZlbmlqYTEXMBUGA1UEYRMOVkFUU0ktMTc2NTk5NTcxFjAU
BgNVBAMTDVNJLVRSVVNUIFJvb3QxDTALBgNVBAMTBENSTDEwEwYDVR0jBAwwCoAITKPDaF4IAmMw
DQYJKoZIhvcNAQELBQADggGBAHuvNSPhY4qcirWJkTwkqaOPqOSV06J/ZepFQfUEJ87TlrGjp4XR
5FLktTAEY/7R4Sgeb2K8OWEl/Koc1BbH6+uyZYvfa+WnnJEWeWOmyPy/vooO7eZyOVvaORxurWOL
CCVDW2wBkbtUoKZaUyzgP+ZPPGRV8GFlbZLCzGmArMGXJXe8t/XNiJDLehGqSWT49NYjyYQdIgI+
qi9W+A6BSUQ9jsMdYJqKhXQcosfH51sc6gZVxTKMr3PsItsa8XFiNazECAAFr0ms7HB6zb8QvHRF
eBGk/CLrW4VkZEBN/JtuyhvgktQ2BvuGtauEvHZQAYpMSh35D7pwtavRMpmhaAsQb4yPqhIMcztw
RqsKPBhWoaFEVZ+Vn3wxap5h/oAhocifNzkWJTNWjxnoPM2eNz2uWFJsgsNhlwteUvnq7+bKTNte
SKWKr6pI+GUsZhmCh5URpUnqUanp0Uie0MD9f3tiOLOp711sNb0xwi+VdDuDB37IddOIsfhPBood
wpoFrTGCAyEwggMdAgEBMEUwPTELMAkGA1UEBhMCc2kxGzAZBgNVBAoTEnN0YXRlLWluc3RpdHV0
aW9uczERMA8GA1UECxMIc2lnZW4tY2ECBDtKDS4wDQYJYIZIAWUDBAIBBQCgggGtMBgGCSqGSIb3
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE5MTIxMjA5Mjc1OVowLwYJKoZIhvcN
AQkEMSIEIBI59PqipgRhzhSirH0K/FTqRN0+Rbw68joOjzWN9MU+MFQGCSsGAQQBgjcQBDFHMEUw
PTELMAkGA1UEBhMCc2kxGzAZBgNVBAoTEnN0YXRlLWluc3RpdHV0aW9uczERMA8GA1UECxMIc2ln
ZW4tY2ECBDtKDS4wVgYLKoZIhvcNAQkQAgsxR6BFMD0xCzAJBgNVBAYTAnNpMRswGQYDVQQKExJz
dGF0ZS1pbnN0aXR1dGlvbnMxETAPBgNVBAsTCHNpZ2VuLWNhAgQ7Sg0uMIGTBgkqhkiG9w0BCQ8x
gYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIw
DgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAsGCWCGSAFlAwQCATALBglghkgBZQMEAgMw
CwYJYIZIAWUDBAICMAcGBSsOAwIaMA0GCSqGSIb3DQEBAQUABIIBANFI3qPyqsSjEZqOFAEwDoKd
iYQ4o/5HniS8qDc2PK79qrFS7qtcxzHV8HWtzMyKPPrdNZrL8vDNmw2SAvyMvJaBerKRrgJoQVO0
Rj5/sodeCESM9prWf+GgmQKRrLK+3soUzhTbacG6zrvd82TJXZOW1cCqquskAt7h/oiRog+Ltquv
ZGpgou+SMlwZdPBNIy8+M2bM1XyP83TXAv0TmuhBCfT0KxenqyUzcYeH7DwBYiAXX+E/U0QSo6OH
AIfGG07dwfTT5+QeWCUkOIiE79nOw7M/DueaqZ+RPuIFR74w4ryeamSssBFPePyLNQrDGL9ceEoV
n8PU+vw5E+WfvZkAAAAAAAA=

------=_NextPart_000_0029_01D5B0D6.D3724930--

--===============6778128274354246712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6778128274354246712==--
