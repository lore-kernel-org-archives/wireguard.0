Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2C8C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 18:24:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F8360F5A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 18:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77F8360F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a8e9bc8;
	Wed, 3 Nov 2021 18:24:06 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c4aea547
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 18:08:05 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 l7-20020a0568302b0700b0055ae988dcc8so1485043otv.12
 for <wireguard@lists.zx2c4.com>; Wed, 03 Nov 2021 11:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=HlmKGrIOpy0gbenDurfhcHJygKLRvYeofBCL0kkpo5E=;
 b=JnzqgWr40ujRzdqhy17oE8pKUmf5kPGyuWbV8xlufnwMhdAzansFZKubskBlo6JItZ
 MXwBREdWkiW/K+DUMTn9wYCdIwBuZFE+2pV7JNMEFEvtZN+/E9nLP/eqxlivVcCJvAQQ
 TDNTUzlvwVrDXoeAbv0uCJAWNOTkdfjoz/OrNmNO7xMkTEU0BWJRbFbJHFVzAf2cS6T1
 yCO97MribPQqZx18LpyYq/eSlfXihw7bHdUrx6oylqJPosODU8DHOYt5lN+7LJ4kx1PN
 aKUy3LHVv0Fk7ELjHhx29H/cXS+gzR2Uno2QNdmJSVEVkK8LDTgxsSqMGv9FbUD5cU2Z
 efnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=HlmKGrIOpy0gbenDurfhcHJygKLRvYeofBCL0kkpo5E=;
 b=1VZGKtXJE5F3EnAUrRgj2mP0zMc4A+0wF/LjhBj47BuiIlps/k2upQf9QJjAIMDh9T
 30y4uM3tHLwh/TQViiRCDPmEVVd49Q6Hfor3KLgrHxQdfx03lufA1RKb9mYWpmpcczom
 bFc9Byia4oTreMDTcdcCggogxAB1Rj/Qe/oZD+VCPnDL/3QpoT8KSji2e7k6PaAiQrv1
 27K1Y+dU5qAhLWhdsubozDD5NGIGnsaO7yVN2QmkHFnrXNaVd99/pxj9P+71ZnEHmzRU
 1ci//hJsI7yJwKQwd77dbESw3DP9z2DkNdGCAVt71brsCCzHvpZ8oNrS6ZiI3QseONFS
 VK1g==
X-Gm-Message-State: AOAM531pKHn1Gzu7FwcTQ4eKFoJkG1jA/VzcY23o+kGiQtoCjm7oolgf
 I5eiWayv1jme6c2UhBOTC+v4BIKbXASiQEOaPhOBMgoi
X-Google-Smtp-Source: ABdhPJw+f5FZEfLDP5/ZvSLDshziDoU6YgyUN7+dXukxMuKlXGCSt7SyJDnX+4zkcx2xOkKmH6eXA7+wZnQ7/hnegZQ=
X-Received: by 2002:a9d:7d01:: with SMTP id v1mr19867275otn.88.1635962883642; 
 Wed, 03 Nov 2021 11:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <CABip9K7f3AKBG9WuJ5_u0n7ExCXKjvdGiy-6YEe8TLzTu0Ezqg@mail.gmail.com>
In-Reply-To: <CABip9K7f3AKBG9WuJ5_u0n7ExCXKjvdGiy-6YEe8TLzTu0Ezqg@mail.gmail.com>
From: Reuben Lifshay <rlifshay@gmail.com>
Date: Wed, 3 Nov 2021 11:07:47 -0700
Message-ID: <CABip9K7zAJKQR__Hj-X9-NxrgG-fw4mxW2dPn1K-MMeAMnSHXA@mail.gmail.com>
Subject: Wireguard Android app stops working on Chrome OS after suspend
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 03 Nov 2021 18:24:03 +0000
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

I've had the Wireguard Android app on my chromebook for awhile and
it's seemed to work just fine. Recently I've started using it more
though, and I discovered that if I closed the lid of my chromebook for
a few minutes or if I let it go to sleep that I can no longer get any
of my tunnels to work. Toggling the tunnels and/or wifi does not fix
it, nor does force stopping the wireguard app. I have to do a full
reboot to get things working correctly again.

I did some debugging and discovered that the wireguard packets were
still being sent to and received by the remote server, but there was
something incorrect about them because they never appeared on the
corresponding wireguard interface on the server. I didn't see anything
that stood out in the app debug log either. After some searching I
found a reddit post where someone discovered that if they downgraded
to version 1.0.20210506 that the issue went away. I didn't try that
myself yet because I don't really want to enable dev mode to allow
sideloading apps right now.

I can enable debug mode for wireguard on one of my servers to get more
info if it would be helpful, but have yet to do so.

Here's a link to the reddit post:
https://www.reddit.com/r/chromeos/comments/q0lbnl/network_troubles_after_version_93_update/

Reuben
