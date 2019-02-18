Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0F2C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 13:51:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4E821901
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 13:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4E821901
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 416dd1fd;
	Mon, 18 Feb 2019 13:43:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85223385
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Feb 2019 13:43:25 +0000 (UTC)
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
 [209.85.166.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4688f97
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Feb 2019 13:43:25 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id r11so41261097itc.2
 for <wireguard@lists.zx2c4.com>; Mon, 18 Feb 2019 05:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGKJ9G7Un1pAgsa9KOwr5d1v1OJFtxcVPk7zhSleqjA=;
 b=TlPvxluxGK38rFJLqOKT/Ctx0fX/VtgP+hm6MTGmstDWrsuVbL9Lv+KdphLP2O7hi5
 0L5QCfLWKlLpL9cgGbgpXi9OlSY6lEkY6+mkvWGohmqjdbhpn/2NQizTcQC52t0eCUP0
 c4LxRjev1NMW0ANcVUxUYiBfvbSgDN36z4PVqY4yq+57cWRP3YrYuV1mZgqPxsu9wcOJ
 sMwAawTTPFsw3yGiAuSI9Sgvi6BXJnU3fC7azR3rScrZushdNEbUGsBofxVfOWJV+RcM
 vMFp6HtG1VrxujEEpvB8As3Qdco9uCtPdrB/U22KlyCbOmDPm+nsvmVYH8YO4y66xZAV
 rtIA==
X-Gm-Message-State: AHQUAubseEMzIjUQ3hVJWfFcsvS2S7EQTIdz9gwRlXlPbmkyZ8eG4GI6
 Fo4+H3FUas5tzONiPj/XuHAzdwVVw5PrDNQl4WtLJpezQFE=
X-Google-Smtp-Source: AHgI3IaUXgGPFmRSKs9DtuNPOzrDZLAhIIBoh09Y3mpQdHpE8o4EgpAKTC+PHnVXvH9v1ntUuIKpCItm40n0PuOe/1U=
X-Received: by 2002:a24:6b44:: with SMTP id v65mr10787389itc.82.1550497909448; 
 Mon, 18 Feb 2019 05:51:49 -0800 (PST)
MIME-Version: 1.0
References: <CACOeLqLQjM1AQPpi31F_Fxvv02tFgD+27qFGjnLnW8KFcy66Kw@mail.gmail.com>
 <1550417524.ondhfeso9t.astroid@morple.none>
In-Reply-To: <1550417524.ondhfeso9t.astroid@morple.none>
From: Raffaele Spazzoli <rspazzol@redhat.com>
Date: Mon, 18 Feb 2019 08:51:38 -0500
Message-ID: <CACOeLqLEo2mX3AXvEPcG6EAOdwQf+PW3BvfKvYFPzsu6vLp5GQ@mail.gmail.com>
Subject: Re: dynamic reload of configuration file
To: "M. Dietrich" <mdt@emdete.de>
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============0308043656823078114=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0308043656823078114==
Content-Type: multipart/alternative; boundary="0000000000001e428a05822b6dd3"

--0000000000001e428a05822b6dd3
Content-Type: text/plain; charset="UTF-8"

Samuel,

I read that section of the docs. it doesn't explain the behavior of those
commands on an already "warm" wireguard device (i.e. while the device is in
up state).

M. Dietrich,

the add conf may work when adding a node, but I also need something when
removing a node of the mesh.

two questions:
1. If initialize a wireguard device with a configuration file and then
update the file will the configuration be updated?
2. if I run the set-conf command on an already initialized wiredguard
device, will the configuration be updated without losing the current (and
still existing after the new configuration) connections?

Thanks,
Raffaele

Raffaele Spazzoli
Senior Architect - OpenShift <https://www.openshift.com>, Containers
and PaaS Practice <https://www.redhat.com/en/services/consulting/paas>
Tel: +1 216-258-7717




On Sun, Feb 17, 2019 at 12:38 PM M. Dietrich <mdt@emdete.de> wrote:

> Quotation from Raffaele Spazzoli at Februar 17, 2019 16:21:
> > I'm using wireguard to build a VPN mesh. The nodes of the mesh are
> dynamic
> > and can come and go at any time. Is there a way to reconfigure a
> wireguard
> > device without restarting it or losing the current connections?
>
> yes.
>
> > If yes, how can it be done?
>
> other way around: configure wireguard with the `wg` command
> and  that is persisted to the configuration file.
>
> on restart the file is read and your config applied.
>
> M. Dietrich
>

--0000000000001e428a05822b6dd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Samuel,<div><br></div><div>I read that section of the docs=
. it doesn&#39;t explain the behavior of those commands on an already &quot=
;warm&quot; wireguard device (i.e. while the device is in up state).</div><=
div><br></div><div>M. Dietrich,</div><div><br></div><div>the add conf may w=
ork when adding a node, but I also need something when removing a node of t=
he mesh.</div><div><br></div><div>two questions:</div><div>1. If initialize=
 a wireguard device with a configuration file and then update the file will=
 the configuration be updated?</div><div>2. if I run the set-conf command o=
n an already initialized wiredguard device, will the configuration be updat=
ed without losing the current (and still existing after the new configurati=
on) connections?</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D=
"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Thanks,<div>Ra=
ffaele</div><div><br></div><div>Raffaele Spazzoli</div><div>Senior Architec=
t - <a href=3D"https://www.openshift.com" target=3D"_blank">OpenShift</a>, =
<a href=3D"https://www.redhat.com/en/services/consulting/paas" target=3D"_b=
lank">Containers and=C2=A0PaaS Practice</a></div><div>Tel: +1 216-258-7717<=
/div><div><br></div><div><br></div></div></div></div></div></div></div></di=
v></div></div></div></div></div><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 17, 2019 at 12:38 PM =
M. Dietrich &lt;<a href=3D"mailto:mdt@emdete.de">mdt@emdete.de</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Quotation fro=
m Raffaele Spazzoli at Februar 17, 2019 16:21:<br>
&gt; I&#39;m using wireguard to build a VPN mesh. The nodes of the mesh are=
 dynamic<br>
&gt; and can come and go at any time. Is there a way to reconfigure a wireg=
uard<br>
&gt; device without restarting it or losing the current connections?<br>
<br>
yes.<br>
<br>
&gt; If yes, how can it be done?<br>
<br>
other way around: configure wireguard with the `wg` command<br>
and=C2=A0 that is persisted to the configuration file.<br>
<br>
on restart the file is read and your config applied.<br>
<br>
M. Dietrich<br>
</blockquote></div>

--0000000000001e428a05822b6dd3--

--===============0308043656823078114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0308043656823078114==--
