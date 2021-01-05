Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B5DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 17:21:06 +0000 (UTC)
X-Greylist: delayed 275 seconds by postgrey-1.34 at mail.kernel.org; Tue, 05 Jan 2021 17:21:05 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 657302226A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ies.univ-montp2.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 657302226A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 17:21:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3df6e115;
	Tue, 5 Jan 2021 17:14:17 +0000 (UTC)
Received: from mailhub-out3.univ-montp2.fr (mailhub-out3.univ-montp2.fr
 [162.38.101.225])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 41d8732d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 11:08:27 +0000 (UTC)
Received: from nodus.ies.univ-montp2.fr (nodus.ies.univ-montp2.fr
 [162.38.134.8])
 by mailhub-out3.univ-montp2.fr (8.15.1/8.15.1) with ESMTP id 105BJOBP006247;
 Tue, 5 Jan 2021 12:19:24 +0100
Received: from mauka.ies.univ-montp2.fr (mauka.ies.univ-montp2.fr
 [162.38.134.64])
 by nodus.ies.univ-montp2.fr (Postfix) with ESMTP id 1790D400B3FC;
 Tue,  5 Jan 2021 12:19:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mauka.ies.univ-montp2.fr (Postfix) with ESMTP id 08862830C3;
 Tue,  5 Jan 2021 12:19:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 ies.univ-montp2.fr; h=references:in-reply-to:subject:subject
 :message-id:from:from:x-mailer:content-transfer-encoding
 :content-type:content-type:date:date:mime-version:received
 :received; s=mail; t=1609845563; x=1611659964; bh=DUQ02/tUiYCW2t
 zBSyg11TD8k2uQdvv+krV+9N907eY=; b=usVTvxzrA80IaH9MCDEru8HFESqc4V
 Ts3laSrf0G7P2zu/uwly/YOGwl+lo56ruoKun7px9VK7ee2YSyHPt4q7NQ0nXpdX
 ebK/PIy5i9PW6NMW9QCmifjLoT7QapakSkJoo6xVrn8UreAMD3HMPk7E5NeTp1+U
 NhqoCs3ynof9w=
X-Virus-Scanned: clamav-milter 0.101.2 at mailhub-out3.univ-montp2.fr
Received: from mauka.ies.univ-montp2.fr ([127.0.0.1])
 by localhost (mauka.ies.univ-montp2.fr [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id d8slFP3iX2RU; Tue,  5 Jan 2021 12:19:23 +0100 (CET)
Received: from webmail.ies.univ-montp2.fr (localhost [127.0.0.1])
 by mauka.ies.univ-montp2.fr (Postfix) with ESMTPSA id BD76282C4A;
 Tue,  5 Jan 2021 12:19:23 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 05 Jan 2021 11:19:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.14.0
From: "Philippe Camps" <philippe.camps@ies.univ-montp2.fr>
Message-ID: <78aa51f772e16b515fb45cf6952ab184@ies.univ-montp2.fr>
Subject: Re: Wireguard connections are lost after a few minutes
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
In-Reply-To: <CAHmME9qxpcmy30wn4ANxLOcwoyi2Rc_UHq_ehNWrEkDeY8gHGQ@mail.gmail.com>
References: <CAHmME9qxpcmy30wn4ANxLOcwoyi2Rc_UHq_ehNWrEkDeY8gHGQ@mail.gmail.com>
 <b20148fb5d1e34fbb61b0b56511ae011@ies.univ-montp2.fr>
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 05 Jan 2021 17:14:15 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,=0A=0ANo I'm not sharing the private key with other machines=0AIf I ha=
ve an another machine, I use an another IP / Key ...=0A=0AToday, I was ab=
le to investigate in my office. I connected my laptop to the same LAN tha=
n the wireguard server. It worked fine with the ethernet cable.=0AThen I =
tried to connect only with the WIFI. It worked perfectly.=0A=0AYesterday,=
 I was at home with my provider and its box (ADSL + WIFI).=0AMy connectio=
ns were working very good with internet. I need to use Wireguard to conne=
ct to the LAN of my company and I get this issue.=0A=0AWeird.=0A=0AWhen m=
y client was 0.1 release and less than 0.2, everything was OK. It looks l=
ike the problem has been happening since I updated my client version. But=
 not sure about it.=0A=0A=0A=0A4 janvier 2021 23:30 "Jason A. Donenfeld" =
<Jason@zx2c4.com> a =C3=A9crit:=0A=0A> Are you sharing the private key wi=
th other machines?
