Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54577C432C3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:05:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E917120678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:05:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtxYjQ7j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E917120678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b298e56;
	Wed, 27 Nov 2019 09:04:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d0dcfae
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Nov 2019 05:09:04 +0000 (UTC)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24dc31f2
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Nov 2019 05:09:04 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id i17so27611357qtq.1
 for <wireguard@lists.zx2c4.com>; Tue, 19 Nov 2019 21:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=7gh7ebUyX0xGMqaOvCBXD3JI3ShAcp0SEJmo8UJ/6tI=;
 b=TtxYjQ7j2bJ/waUyO9joe/TtqcT2M2df3IYCvDSO92ynyiq/Ei0Uasy+odxUC92oyR
 KBEQmDSE//nCHu6BlgM9u0P2Tf1gT/vJe88srOVMF5XjP5yDLL4JEMLM9MJXhACHbXhW
 qIpsHgoLAOGqOPyNsCIzv1WY3Jk1es/haQ6r63g5jA25X9GaSLGMjAd3ZhGHc2NWOsmi
 Km3MM1MBDxDch831ULuDbg3nanAjclTNMTc2uNebRpzkMMRj1Mny5hGF7ad9ht5ZnUvx
 17KLLD/dYmHb/VJFhAIL/Oem1WiNxuLxeIG0w7pkAEqZKP1QU8zWd3TWaAW93EGb/45j
 auZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=7gh7ebUyX0xGMqaOvCBXD3JI3ShAcp0SEJmo8UJ/6tI=;
 b=LWZMhtx3wpijf5I7PgT5VEQJg+QdyyOFvy79yBifPkXHSwBlT0oUXAp/o8NZH9nbQH
 7YjGel3AUIfGISnHfleNShAl9fLhMzAKhJ0MrmGJHcvOVNfuvy7VIb2LyQ3YIiXAbnvk
 ZX/yC3joyLS3N2LZ+IaxIIzC3qmN3Uwm6A7sfc26gEnuUQLeCs6pkUzZx5YqAKlQZeda
 HEDv/nbaX4cAE48/dAdVgKIvGiLuRPHN5gRmwqrAkGrhpvr2tiwhQ4OKhwSoVPSQMuZz
 GInXD4sQmw4XPkfwlzflet0VNWMZdL2H1MmcDyaT2Y4YJad8IbREVSDXJRP2Y1uIszhQ
 NSyQ==
X-Gm-Message-State: APjAAAXXxClIwyQ5s7dwJjI6G7fqn6VURHf1Q7JhNrRh/IF4FaZUmEh2
 e9IvHnwRcGXx/TK6Xg1ChpzC0EziAateAzXRC0uPinGaPKw=
X-Google-Smtp-Source: APXvYqztfCxrILpad5iMnN0u1KSfGVkAfvxuU96+lVnVfy5vGspT0dwshcr2RY/TKT+a21+3UJjkTAmDTMxLxUVMzJ4=
X-Received: by 2002:aed:2f01:: with SMTP id l1mr949508qtd.232.1574226543171;
 Tue, 19 Nov 2019 21:09:03 -0800 (PST)
MIME-Version: 1.0
References: <CAJcUPC7nXZXO6aJYMsEF3TYkLneftvH3VRNUtfVaGjWJTtkvWw@mail.gmail.com>
In-Reply-To: <CAJcUPC7nXZXO6aJYMsEF3TYkLneftvH3VRNUtfVaGjWJTtkvWw@mail.gmail.com>
From: Alexey Ivanov <alexey.ivanes@gmail.com>
Date: Wed, 20 Nov 2019 08:08:50 +0300
Message-ID: <CAJcUPC6YHtYy6f66+GQqsmPKMKWtiuLCx4+4VNxX9rGFFAkpjQ@mail.gmail.com>
Subject: Fwd: Wireguard for Windows breaks Task Scheduler
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
Content-Type: multipart/mixed; boundary="===============8840961650776454763=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8840961650776454763==
Content-Type: multipart/alternative; boundary="000000000000e6dbac0597c02ddd"

--000000000000e6dbac0597c02ddd
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

--000000000000e6dbac0597c02ddd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Im not exactly sure what wireguard doing to create virtual=
 network adapters in windows, but it&#39;s more looks like it can&#39;t han=
dle deletion of them properly. <br><div class=3D"gmail_quote"><div dir=3D"l=
tr"><div>This issue easy to reproduce: <br></div><ol><li>Create wireguard&#=
39;s tunnels.</li><li>Connect tunnel, disconnect and remove it.</li><li>Rep=
eat it multiple times.</li></ol><div>Windows registry will be full of wrong=
 records of these non-existed network connections.</div><div>And now try to=
 open Task Scheduler and click on &quot;Create task...&quot; it will crash =
with log:</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div>=D0=B2 Microsoft.Windows.ManagementUI.CombinedControls.INetwork.G=
etName()<br>=C2=A0 =D0=B2 Microsoft.Windows.ManagementUI.CombinedControls.U=
INetwork.GetUINetwork(INetwork network)<br>=C2=A0 =D0=B2 Microsoft.Windows.=
ManagementUI.CombinedControls.NetworkListManager.GetNetworkList()<br>=C2=A0=
 =D0=B2 Microsoft.Windows.ManagementUI.CombinedControls.ControlTaskConditio=
ns.PopulateNetworkComboBox()<br>=C2=A0 =D0=B2 Microsoft.Windows.ManagementU=
I.CombinedControls.ControlTaskConditions.InitializeConditions()<br>=C2=A0 =
=D0=B2 Microsoft.Windows.ManagementUI.CombinedControls.EditTaskDialog.Initi=
alizeView()<br>=C2=A0 =D0=B2 Microsoft.Windows.ManagementUI.CombinedControl=
s.EditTaskDialog.Initialize(UITaskFolder folder, String taskName, String ti=
tle, UserChoice userAction, BaseResultsControl inOwnerView, String inXmlTex=
t)<br>=C2=A0 =D0=B2 Microsoft.Windows.ManagementUI.CombinedControls.BaseRes=
ultsControl.CreateTask(UITaskFolder folder, String initialTaskName, String =
taskXml)<br>=C2=A0 =D0=B2 System.Windows.Forms.MenuItem.OnClick(EventArgs e=
)<br>=C2=A0 =D0=B2 System.Windows.Forms.MenuItem.MenuItemData.Execute()<br>=
=C2=A0 =D0=B2 System.Windows.Forms.Command.Invoke()<br>=C2=A0 =D0=B2 System=
.Windows.Forms.Control.WmCommand(Message&amp; m)<br>=C2=A0 =D0=B2 System.Wi=
ndows.Forms.Control.WndProc(Message&amp; m)<br>=C2=A0 =D0=B2 System.Windows=
.Forms.ListView.WndProc(Message&amp; m)<br>=C2=A0 =D0=B2 System.Windows.For=
ms.NativeWindow.Callback(IntPtr hWnd, Int32 msg, IntPtr wparam, IntPtr lpar=
am) </div></blockquote><div><br></div><div>So ive googled solution <a href=
=3D"https://answers.microsoft.com/en-us/windows/forum/all/task-scheduler-cr=
ashed/5acab7c5-eb79-48c8-876d-ade321565953?auth=3D1" target=3D"_blank">http=
s://answers.microsoft.com/en-us/windows/forum/all/task-scheduler-crashed/5a=
cab7c5-eb79-48c8-876d-ade321565953?auth=3D1</a> (Programatix message)</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>To re=
solve the problem,<br>=C2=A0 =C2=A0 Run regedit<br>=C2=A0 =C2=A0 Go to HKLM=
\Software\Microsoft\Windows NT\CurrentVersion\NetworkList<br>=C2=A0 =C2=A0 =
Delete everything under the following path,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Nla-&gt;Cache<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Nla-&gt;IntranetEnabled<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Nla-&gt;Wireless<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Pr=
ofiles<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Signatures-&gt;Managed<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Signatures-&gt;Unmanaged<br>=C2=A0 =C2=A0 Reboot</div></b=
lockquote><div><br></div><div>And it actually helps.</div><div>Can wireguar=
d just properly handle this &quot;issue&quot; on his own and do not break T=
ask Scheduler application?<br></div></div>
</div></div>

--000000000000e6dbac0597c02ddd--

--===============8840961650776454763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8840961650776454763==--
