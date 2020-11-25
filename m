Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD39C56201
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 20:14:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70DA207BB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 20:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70DA207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bestov.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb57380c;
	Wed, 25 Nov 2020 20:07:48 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bfd433f9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 20:07:46 +0000 (UTC)
X-Originating-IP: 79.52.27.94
Received: from localhost (host-79-52-27-94.retail.telecomitalia.it
 [79.52.27.94]) (Authenticated sender: pbl@bestov.io)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5F65E40002;
 Wed, 25 Nov 2020 20:13:26 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: RE: Using WireGuard on Windows as non-admin - proper solution?
From: "Riccardo Paolo Bestetti" <pbl@bestov.io>
To: "Clint Dovholuk" <clint.dovholuk@netfoundry.io>
Date: Wed, 25 Nov 2020 21:10:29 +0100
Message-Id: <C7CM8T00KR95.20C45R3IEYZ6T@enhorning>
In-Reply-To: <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
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

On Wed Nov 25, 2020 at 6:57 PM CET, Clint Dovholuk wrote:
> Out of curiosity - why not just use " S-1-5-4" Interactive - " A group
> that
> includes all users that have logged on interactively. Membership is
> controlled by the operating system."
>
> If the user logged on - let the turn the tunnel on/off?
Isn't this akin to having no permissions at all?

Furthermore, I think the point of this feature is to give more
fine-grained control to IT admins. Which it accomplishes, without
introducing much complexity. Piece of beauty!

Riccardo

