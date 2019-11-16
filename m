Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB79C43215
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:04:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9034D20678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WR/EUr+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9034D20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4beeb8c;
	Wed, 27 Nov 2019 09:04:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 874b9a9a
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Nov 2019 22:24:34 +0000 (UTC)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de35a470
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Nov 2019 22:24:34 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id y10so15381924qto.3
 for <wireguard@lists.zx2c4.com>; Sat, 16 Nov 2019 14:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sD75zu9Zo7gIAkH/BVmugWlHAV6Wrsyu9/vvOvdbXgI=;
 b=WR/EUr+rxXqvpa8i4evx+gpgawUUrJtLbCf4m/1lywYVNbk3PKE9sVKbPvfnJqQGk7
 svR+cHZgawfDZFSxzhSWjxATBGUUQFrbY6srlMDJm3idF03X7kw4PGfWrp4meMDKGx86
 478MwUrgFi/6IZ3JNoRc6i14dA0AfR3FFSujal3VZyCocBZh0P6f+pZ9cWdYxnByLcK4
 dxXaFagpTt7ZhKomr43vMBP/0+mttdc0FlEU1WXfU4i5hgav2VqRkI0hUx2SrMxar0PW
 4xoefgqgU2YpX+ZQ9cNU+/e/M5kURmTeBnEwTg8Nd8YlpD50XLwzjQsaxgs+yMVk7AxB
 vvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sD75zu9Zo7gIAkH/BVmugWlHAV6Wrsyu9/vvOvdbXgI=;
 b=eCquRpjNVc294AuAnY4n8fqic4VxIQywbeXPaRji61VjkkbmGyPQAcAu16PZgfCLVd
 CrcKe5O7MjeupLH7cvdFj/1m6B+FqsA+rrnU2zbcP6P5sUsHsGd2l91RVnip/VTKMU/C
 faDUvtaCTZh+GnfbxpJJJt0I3ZZ9GpePGsHzEDiPZ1kek+JppUYs8w0CEYs+P0KoozhK
 +RPiW+Qr4azt4tC9wBzGVHn5IN/DctG055zl0/zksYDY2Cb8gQq/xwks0086ViruhXgn
 l+gpk4KqjMAQfn3FJtWIWX5mWrxupEpHnQnVBmDhL0QU78GNw55E8ibW5IGMC3s2WVpT
 pvSQ==
X-Gm-Message-State: APjAAAVmaui2AAGjzIq4m5IM0z+x1F9FPd7mtmgdbph10JErkW2pFsTu
 6fh5ll2yK3gyCP7F8Cl4Jbb0HrOd3/ATQNKfRVCfTFlH00WqTw==
X-Google-Smtp-Source: APXvYqwDlZv0UoUVLqy/pCldFLvCBcvR1Dv5VB9763j6nNfAtSqNTJw8sNLAiJ761xqna64c9HHGriMQ8UtLGP6b+DQ=
X-Received: by 2002:ac8:2361:: with SMTP id b30mr20595736qtb.322.1573943073358; 
 Sat, 16 Nov 2019 14:24:33 -0800 (PST)
MIME-Version: 1.0
From: Alexey Ivanov <alexey.ivanes@gmail.com>
Date: Sun, 17 Nov 2019 01:24:19 +0300
Message-ID: <CAJcUPC7nXZXO6aJYMsEF3TYkLneftvH3VRNUtfVaGjWJTtkvWw@mail.gmail.com>
Subject: Wireguard for Windows breaks Task Scheduler
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:04:23 +0100
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
Content-Type: multipart/mixed; boundary="===============3669260473521583490=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3669260473521583490==
Content-Type: multipart/alternative; boundary="000000000000c8c7fe05977e2d9e"

--000000000000c8c7fe05977e2d9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Im not exactly sure what wireguard doing to create virtual network adapters
in windows, but it's more looks like it can't handle deletion of them
properly.
This issue easy to reproduce:

   1. Create wireguard's tunnels.
   2. Connect tunnel, disconnect and remove it.
   3. Repeat it multiple times.

Windows registry will be full of wrong records of these non-existed network
connections.
And now try to open Task Scheduler and click on "Create task..." it will
crash with log:

=D0=B2 Microsoft.Windows.ManagementUI.CombinedControls.INetwork.GetName()
>   =D0=B2
> Microsoft.Windows.ManagementUI.CombinedControls.UINetwork.GetUINetwork(IN=
etwork
> network)
>   =D0=B2
> Microsoft.Windows.ManagementUI.CombinedControls.NetworkListManager.GetNet=
workList()
>   =D0=B2
> Microsoft.Windows.ManagementUI.CombinedControls.ControlTaskConditions.Pop=
ulateNetworkComboBox()
>   =D0=B2
> Microsoft.Windows.ManagementUI.CombinedControls.ControlTaskConditions.Ini=
tializeConditions()
>   =D0=B2
> Microsoft.Windows.ManagementUI.CombinedControls.EditTaskDialog.Initialize=
View()
>   =D0=B2
> Microsoft.Windows.ManagementUI.CombinedControls.EditTaskDialog.Initialize=
(UITaskFolder
> folder, String taskName, String title, UserChoice userAction,
> BaseResultsControl inOwnerView, String inXmlText)
>   =D0=B2
> Microsoft.Windows.ManagementUI.CombinedControls.BaseResultsControl.Create=
Task(UITaskFolder
> folder, String initialTaskName, String taskXml)
>   =D0=B2 System.Windows.Forms.MenuItem.OnClick(EventArgs e)
>   =D0=B2 System.Windows.Forms.MenuItem.MenuItemData.Execute()
>   =D0=B2 System.Windows.Forms.Command.Invoke()
>   =D0=B2 System.Windows.Forms.Control.WmCommand(Message& m)
>   =D0=B2 System.Windows.Forms.Control.WndProc(Message& m)
>   =D0=B2 System.Windows.Forms.ListView.WndProc(Message& m)
>   =D0=B2 System.Windows.Forms.NativeWindow.Callback(IntPtr hWnd, Int32 ms=
g,
> IntPtr wparam, IntPtr lparam)
>

So ive googled solution
https://answers.microsoft.com/en-us/windows/forum/all/task-scheduler-crashe=
d/5acab7c5-eb79-48c8-876d-ade321565953?auth=3D1
(Programatix message)

To resolve the problem,
>     Run regedit
>     Go to HKLM\Software\Microsoft\Windows NT\CurrentVersion\NetworkList
>     Delete everything under the following path,
>         Nla->Cache
>         Nla->IntranetEnabled
>         Nla->Wireless
>         Profiles
>         Signatures->Managed
>         Signatures->Unmanaged
>     Reboot
>

And it actually helps.
Can wireguard just properly handle this "issue" on his own and do not break
Task Scheduler application?

--000000000000c8c7fe05977e2d9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Im not exactly sure what wireguard doing to create vi=
rtual network adapters in windows, but it&#39;s more looks like it can&#39;=
t handle deletion of them properly. <br></div><div>This issue easy to repro=
duce: <br></div><ol><li>Create wireguard&#39;s tunnels.</li><li>Connect tun=
nel, disconnect and remove it.</li><li>Repeat it multiple times.</li></ol><=
div>Windows registry will be full of wrong records of these non-existed net=
work connections.</div><div>And now try to open Task Scheduler and click on=
 &quot;Create task...&quot; it will crash with log:</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div>=D0=B2 Microsoft.Window=
s.ManagementUI.CombinedControls.INetwork.GetName()<br>=C2=A0 =D0=B2 Microso=
ft.Windows.ManagementUI.CombinedControls.UINetwork.GetUINetwork(INetwork ne=
twork)<br>=C2=A0 =D0=B2 Microsoft.Windows.ManagementUI.CombinedControls.Net=
workListManager.GetNetworkList()<br>=C2=A0 =D0=B2 Microsoft.Windows.Managem=
entUI.CombinedControls.ControlTaskConditions.PopulateNetworkComboBox()<br>=
=C2=A0 =D0=B2 Microsoft.Windows.ManagementUI.CombinedControls.ControlTaskCo=
nditions.InitializeConditions()<br>=C2=A0 =D0=B2 Microsoft.Windows.Manageme=
ntUI.CombinedControls.EditTaskDialog.InitializeView()<br>=C2=A0 =D0=B2 Micr=
osoft.Windows.ManagementUI.CombinedControls.EditTaskDialog.Initialize(UITas=
kFolder folder, String taskName, String title, UserChoice userAction, BaseR=
esultsControl inOwnerView, String inXmlText)<br>=C2=A0 =D0=B2 Microsoft.Win=
dows.ManagementUI.CombinedControls.BaseResultsControl.CreateTask(UITaskFold=
er folder, String initialTaskName, String taskXml)<br>=C2=A0 =D0=B2 System.=
Windows.Forms.MenuItem.OnClick(EventArgs e)<br>=C2=A0 =D0=B2 System.Windows=
.Forms.MenuItem.MenuItemData.Execute()<br>=C2=A0 =D0=B2 System.Windows.Form=
s.Command.Invoke()<br>=C2=A0 =D0=B2 System.Windows.Forms.Control.WmCommand(=
Message&amp; m)<br>=C2=A0 =D0=B2 System.Windows.Forms.Control.WndProc(Messa=
ge&amp; m)<br>=C2=A0 =D0=B2 System.Windows.Forms.ListView.WndProc(Message&a=
mp; m)<br>=C2=A0 =D0=B2 System.Windows.Forms.NativeWindow.Callback(IntPtr h=
Wnd, Int32 msg, IntPtr wparam, IntPtr lparam) </div></blockquote><div><br><=
/div><div>So ive googled solution <a href=3D"https://answers.microsoft.com/=
en-us/windows/forum/all/task-scheduler-crashed/5acab7c5-eb79-48c8-876d-ade3=
21565953?auth=3D1">https://answers.microsoft.com/en-us/windows/forum/all/ta=
sk-scheduler-crashed/5acab7c5-eb79-48c8-876d-ade321565953?auth=3D1</a> (Pro=
gramatix message)</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div>To resolve the problem,<br>=C2=A0 =C2=A0 Run regedit<br>=
=C2=A0 =C2=A0 Go to HKLM\Software\Microsoft\Windows NT\CurrentVersion\Netwo=
rkList<br>=C2=A0 =C2=A0 Delete everything under the following path,<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Nla-&gt;Cache<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Nla-&=
gt;IntranetEnabled<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Nla-&gt;Wireless<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Profiles<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Signatures=
-&gt;Managed<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Signatures-&gt;Unmanaged<br>=C2=
=A0 =C2=A0 Reboot</div></blockquote><div><br></div><div>And it actually hel=
ps.</div><div>Can wireguard just properly handle this &quot;issue&quot; on =
his own and do not break Task Scheduler application?<br></div></div>

--000000000000c8c7fe05977e2d9e--

--===============3669260473521583490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3669260473521583490==--
