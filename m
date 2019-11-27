Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466C5C2D0CA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 09:54:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83642214AF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 09:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="KhOYTcwu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83642214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26a0a731;
	Thu, 12 Dec 2019 09:54:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c09bf55e
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 10:55:40 +0000 (UTC)
Received: from pub5.amebis.si (pub5.amebis.si [IPv6:2a00:ee2:209:164::f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca77f24f
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 10:55:40 +0000 (UTC)
Received: by pub5.amebis.si (Postfix, from userid 1000)
 id 1C26E1002B6F; Wed, 27 Nov 2019 11:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1574852138;
 bh=yJW0KoLKgk8LcdpxOxA6VRmg5XIfQ7qJCMWCGRsTZVc=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=KhOYTcwuas0Y/N6wdUhJ3Y4pB0XwPlVkRDbq/bUQSBnlklcbLKemuUqERSMB2oNKW
 2E3PwC9ZCwXAZBmQokhWp0cTpAWQVHRXnN1czopXzgaaHVdxVQm9xuvLSRS7x31X2M
 +nPpwOKyCvF+921lE9KWgktUScbQoF6vZPfCdL60=
Received: from PLANJAVA.amebis.doma (planjava.amebis.doma
 [IPv6:2a00:ee2:209:164::2])
 by pub5.amebis.si (Postfix) with ESMTPS id 0038D1002F28;
 Wed, 27 Nov 2019 11:55:34 +0100 (CET)
Received: from PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035]) by
 PLANJAVA.amebis.doma ([fe80::a486:6f91:d7b9:9035%17]) with mapi id
 14.03.0468.000; Wed, 27 Nov 2019 11:55:34 +0100
From: Simon Rozman <simon@rozman.si>
To: Alexey Ivanov <alexey.ivanes@gmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: Wireguard for Windows breaks Task Scheduler
Thread-Topic: Wireguard for Windows breaks Task Scheduler
Thread-Index: AQHVpQJFAdUTJA5HqU+9qtScyq1YjKee1teg
Date: Wed, 27 Nov 2019 10:55:33 +0000
Message-ID: <99D61A626FDA8A4B90A270669121BE10C9B3E657@PLANJAVA.amebis.doma>
References: <CAJcUPC7nXZXO6aJYMsEF3TYkLneftvH3VRNUtfVaGjWJTtkvWw@mail.gmail.com>
In-Reply-To: <CAJcUPC7nXZXO6aJYMsEF3TYkLneftvH3VRNUtfVaGjWJTtkvWw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8588470251564625347=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8588470251564625347==
Content-Language: en-US
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=2.16.840.1.101.3.4.2.1;
	boundary="----=_NextPart_000_0011_01D5A519.9228F1E0"

------=_NextPart_000_0011_01D5A519.9228F1E0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0012_01D5A519.9228F1E0"


------=_NextPart_001_0012_01D5A519.9228F1E0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexey!

=20

Unfortunately, this piling of NLA profiles was solved in WireGuard for =
Windows 10 only. Windows 7 and 8 will create a new NLA entry each time =
WireGuard connects.

=20

It's the same situation as if you would connect your laptop to 100 or =
more WiFis in the past.

=20

You should address your question why so many NLA profiles crash Task =
Scheduler to Microsoft.

=20

Best regards,

Simon

=20

From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Alexey =
Ivanov
Sent: Saturday, November 16, 2019 11:24 PM
To: wireguard@lists.zx2c4.com
Subject: Wireguard for Windows breaks Task Scheduler

=20

Im not exactly sure what wireguard doing to create virtual network =
adapters in windows, but it's more looks like it can't handle deletion =
of them properly.=20

This issue easy to reproduce:=20

1.	Create wireguard's tunnels.
2.	Connect tunnel, disconnect and remove it.
3.	Repeat it multiple times.

Windows registry will be full of wrong records of these non-existed =
network connections.

And now try to open Task Scheduler and click on "Create task..." it will =
crash with log:

=20

=D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.INetwork.GetName()
  =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.UINetwork.GetUINetwork(IN=
etwork network)
  =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.NetworkListManager.GetNet=
workList()
  =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.ControlTaskConditions.Pop=
ulateNetworkComboBox()
  =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.ControlTaskConditions.Ini=
tializeConditions()
  =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.EditTaskDialog.Initialize=
View()
  =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.EditTaskDialog.Initialize=
(UITaskFolder folder, String taskName, String title, UserChoice =
userAction, BaseResultsControl inOwnerView, String inXmlText)
  =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.BaseResultsControl.Create=
Task(UITaskFolder folder, String initialTaskName, String taskXml)
  =D0=B2 System.Windows.Forms.MenuItem.OnClick(EventArgs e)
  =D0=B2 System.Windows.Forms.MenuItem.MenuItemData.Execute()
  =D0=B2 System.Windows.Forms.Command.Invoke()
  =D0=B2 System.Windows.Forms.Control.WmCommand(Message& m)
  =D0=B2 System.Windows.Forms.Control.WndProc(Message& m)
  =D0=B2 System.Windows.Forms.ListView.WndProc(Message& m)
  =D0=B2 System.Windows.Forms.NativeWindow.Callback(IntPtr hWnd, Int32 =
msg, IntPtr wparam, IntPtr lparam)=20

=20

So ive googled solution =
https://answers.microsoft.com/en-us/windows/forum/all/task-scheduler-cras=
hed/5acab7c5-eb79-48c8-876d-ade321565953?auth=3D1 (Programatix message)

=20

To resolve the problem,
    Run regedit
    Go to HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkList
    Delete everything under the following path,
        Nla->Cache
        Nla->IntranetEnabled
        Nla->Wireless
        Profiles
        Signatures->Managed
        Signatures->Unmanaged
    Reboot

=20

And it actually helps.

Can wireguard just properly handle this "issue" on his own and do not =
break Task Scheduler application?


------=_NextPart_001_0012_01D5A519.9228F1E0
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
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
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
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:2100905263;
	mso-list-template-ids:-1146718990;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DSL link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'mso-fareast-language:EN-US'>Hi =
Alexey!<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>Unfortunately, this piling of NLA =
profiles was solved in WireGuard for Windows 10 only. Windows 7 and 8 =
will create a new NLA entry each time WireGuard =
connects.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>It's the same situation as if you =
would connect your laptop to 100 or more WiFis in the =
past.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'>You should address your question =
why so many NLA profiles crash Task Scheduler to =
Microsoft.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>Best =
regards,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Simon<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB =
style=3D'mso-fareast-language:EN-US'><o:p>&nbsp;</o:p></span></p><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt'><div><div style=3D'border:none;border-top:solid #E1E1E1 =
1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal><b><span =
lang=3DEN-GB>From:</span></b><span lang=3DEN-GB> WireGuard =
&lt;wireguard-bounces@lists.zx2c4.com&gt; <b>On Behalf Of </b>Alexey =
Ivanov<br><b>Sent:</b> Saturday, November 16, 2019 11:24 =
PM<br><b>To:</b> wireguard@lists.zx2c4.com<br><b>Subject:</b> Wireguard =
for Windows breaks Task Scheduler<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>Im not exactly sure what wireguard =
doing to create virtual network adapters in windows, but it's more looks =
like it can't handle deletion of them properly. =
<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB>This issue easy to reproduce: =
<o:p></o:p></span></p></div><ol start=3D1 type=3D1><li class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l0 =
level1 lfo1'><span lang=3DEN-GB>Create wireguard's =
tunnels.<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l0 =
level1 lfo1'><span lang=3DEN-GB>Connect tunnel, disconnect and remove =
it.<o:p></o:p></span></li><li class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;mso-list:l0 =
level1 lfo1'><span lang=3DEN-GB>Repeat it multiple =
times.<o:p></o:p></span></li></ol><div><p class=3DMsoNormal><span =
lang=3DEN-GB>Windows registry will be full of wrong records of these =
non-existed network connections.<o:p></o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>And now try to open Task Scheduler =
and click on &quot;Create task...&quot; it will crash with =
log:<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-right:0cm'><div><p =
class=3DMsoNormal><span lang=3DEN-GB>=D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.INetwork.GetName()<br>&nb=
sp; =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.UINetwork.GetUINetwork(IN=
etwork network)<br>&nbsp; =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.NetworkListManager.GetNet=
workList()<br>&nbsp; =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.ControlTaskConditions.Pop=
ulateNetworkComboBox()<br>&nbsp; =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.ControlTaskConditions.Ini=
tializeConditions()<br>&nbsp; =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.EditTaskDialog.Initialize=
View()<br>&nbsp; =D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.EditTaskDialog.Initialize=
(UITaskFolder folder, String taskName, String title, UserChoice =
userAction, BaseResultsControl inOwnerView, String inXmlText)<br>&nbsp; =
=D0=B2 =
Microsoft.Windows.ManagementUI.CombinedControls.BaseResultsControl.Create=
Task(UITaskFolder folder, String initialTaskName, String =
taskXml)<br>&nbsp; =D0=B2 =
System.Windows.Forms.MenuItem.OnClick(EventArgs e)<br>&nbsp; =D0=B2 =
System.Windows.Forms.MenuItem.MenuItemData.Execute()<br>&nbsp; =D0=B2 =
System.Windows.Forms.Command.Invoke()<br>&nbsp; =D0=B2 =
System.Windows.Forms.Control.WmCommand(Message&amp; m)<br>&nbsp; =D0=B2 =
System.Windows.Forms.Control.WndProc(Message&amp; m)<br>&nbsp; =D0=B2 =
System.Windows.Forms.ListView.WndProc(Message&amp; m)<br>&nbsp; =D0=B2 =
System.Windows.Forms.NativeWindow.Callback(IntPtr hWnd, Int32 msg, =
IntPtr wparam, IntPtr lparam) =
<o:p></o:p></span></p></div></blockquote><div><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>So ive googled solution <a =
href=3D"https://answers.microsoft.com/en-us/windows/forum/all/task-schedu=
ler-crashed/5acab7c5-eb79-48c8-876d-ade321565953?auth=3D1">https://answer=
s.microsoft.com/en-us/windows/forum/all/task-scheduler-crashed/5acab7c5-e=
b79-48c8-876d-ade321565953?auth=3D1</a> (Programatix =
message)<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0cm 0cm =
6.0pt;margin-left:4.8pt;margin-right:0cm'><div><p =
class=3DMsoNormal><span lang=3DEN-GB>To resolve the problem,<br>&nbsp; =
&nbsp; Run regedit<br>&nbsp; &nbsp; Go to =
HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkList<br>&nbsp; =
&nbsp; Delete everything under the following path,<br>&nbsp; &nbsp; =
&nbsp; &nbsp; Nla-&gt;Cache<br>&nbsp; &nbsp; &nbsp; &nbsp; =
Nla-&gt;IntranetEnabled<br>&nbsp; &nbsp; &nbsp; &nbsp; =
Nla-&gt;Wireless<br>&nbsp; &nbsp; &nbsp; &nbsp; Profiles<br>&nbsp; =
&nbsp; &nbsp; &nbsp; Signatures-&gt;Managed<br>&nbsp; &nbsp; &nbsp; =
&nbsp; Signatures-&gt;Unmanaged<br>&nbsp; &nbsp; =
Reboot<o:p></o:p></span></p></div></blockquote><div><p =
class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p></div><div><p =
class=3DMsoNormal><span lang=3DEN-GB>And it actually =
helps.<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
lang=3DEN-GB>Can wireguard just properly handle this &quot;issue&quot; =
on his own and do not break Task Scheduler =
application?<o:p></o:p></span></p></div></div></div></div></body></html>
------=_NextPart_001_0012_01D5A519.9228F1E0--

------=_NextPart_000_0011_01D5A519.9228F1E0
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
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE5MTEyNzEwNTUzMlowLwYJKoZIhvcN
AQkEMSIEIAXITaDcbo8hrGZzyy5WbQxHVL2+K289LQAF3igN57g+MFQGCSsGAQQBgjcQBDFHMEUw
PTELMAkGA1UEBhMCc2kxGzAZBgNVBAoTEnN0YXRlLWluc3RpdHV0aW9uczERMA8GA1UECxMIc2ln
ZW4tY2ECBDtKDS4wVgYLKoZIhvcNAQkQAgsxR6BFMD0xCzAJBgNVBAYTAnNpMRswGQYDVQQKExJz
dGF0ZS1pbnN0aXR1dGlvbnMxETAPBgNVBAsTCHNpZ2VuLWNhAgQ7Sg0uMIGTBgkqhkiG9w0BCQ8x
gYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggqhkiG9w0DBzALBglghkgBZQMEAQIw
DgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAsGCWCGSAFlAwQCATALBglghkgBZQMEAgMw
CwYJYIZIAWUDBAICMAcGBSsOAwIaMA0GCSqGSIb3DQEBAQUABIIBAEmof+mN0y7t1pW0glDJp/mC
X+dkEgnYHZ9RCtoKMz7YGYhqdzVGVLoWc5R+XBJxOG+d9bOifa/zbnbZJ027LiEWWyb0F1nISW6J
CZ1juxibMfB13q/wiRLMZu1HsTDthCPgPmpG9dJEVgyZkXNAteBXRAxs1JI9IH4vmtuDe0kuM+Zc
a9J5RGF7Uw2jeZX+evArflI4bQcrX4Ea7qlrrcHO5+l7ihbY0uavvJgx05y5LHZh4PiOJmXCY5ph
U+pmSjzp3WsaaFHJc1sxpEBBUwO9txzAPhp7FQhqAEKwqIFOTseKxRjlVcpZWdCr5S8qwc/tK/cN
MhF7EbSG+75l26UAAAAAAAA=

------=_NextPart_000_0011_01D5A519.9228F1E0--

--===============8588470251564625347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8588470251564625347==--
