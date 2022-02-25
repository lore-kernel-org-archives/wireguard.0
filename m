Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F75C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Mar 2022 17:16:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e4b98f85;
	Mon, 14 Mar 2022 17:11:46 +0000 (UTC)
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 406f2c82
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Feb 2022 17:31:54 +0000 (UTC)
Date: Fri, 25 Feb 2022 17:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xfs.repair;
 s=protonmail3; t=1645810313;
 bh=MMFekGoI1vxhoSyFCMRJKePrtCjMekeJmy0/erJPzc4=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID;
 b=kD+MDMNsD5QQ8M6tv0nvuygXJCwzHJWCSWW48sJUPGa/THLDhDwU61nhw62J+nANg
 Hzh8Aj3GHEHUcZUMS56+znOCLSQ8uvE7QgKnDGPgLWwBs8lsfC1Iqwy+WgykaaxFwU
 HfYhiuIDoSUqi42HhEpjcnucCfnpQia3u8SA867nzMjDQAF6tj5ybJX5YOS/b9gpmn
 W3BSf6VVMZ+onXfWtO2F2X5/xduP+tRfFOua9nIyHwtz9LeQuo/StXwTW8Z/IGl+6O
 EbR8GjKEOqn8xtvNAsuW2otq4D6rVTjEbcwnQ3Fqp/4WE4EpUU+4WOtm+ii/qjPH+E
 1FJ7Ti7JNkOWQ==
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Michael Hicklen <michael@xfs.repair>
Subject: WireDuard On-Connect DNS Lookup Failure (tries UDP/53,
 does not fail over to TCP/53)
Message-ID: <65VYfOmhDVJ1vrxWr5SuNQBkEUwy8XE6yXij13fOizK7JCUYLoSM_4SXFHM_rhz2JLgsSX0gidKKuEnH7TqxDuFkpQ2OMKXUHe-lgViMrBU=@xfs.repair>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 14 Mar 2022 17:11:40 +0000
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
Reply-To: Michael Hicklen <michael@xfs.repair>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi all,

I've noticed an issue today with WireGuard where it will fail to connect to=
 a hostname when attempting to resolve DNS in a situation where UDP DNS loo=
kups are disabled. This is reproducible by disabling UDP 53 egress, or by c=
onnecting to ExpressVPN first then trying to connect WireGuard to a server =
using a hostname.

This is an edge case, but I think it would be excellent if WireGuard were t=
o attempt to fall back on TCP instead of failing out at the UDP lookup.

Note this is orthogonal to the endless requests for WireGuard to support TC=
P tunneling - that is not what I'm talking about here.

--
Michael Hicklen
michael@xfs.repair
