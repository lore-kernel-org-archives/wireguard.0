Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A08C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:11:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 871E52080D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pykGI/7y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 871E52080D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42a33cbc;
	Wed, 17 Jun 2020 23:52:51 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7e4edbb4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 23:52:49 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ce7f692
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 23:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:cc:content-type; s=mail; bh=Ns/
 nhK/YKDwPDpCWx1/4B47gNE4=; b=pykGI/7yuD9wuQERL2U2Bovle1sJ0DavXJA
 fSv4lEyJsT6QkiwYVERjNFKircb9jSrsxisOLi87dj62Pn5VuzDRvicLqCkSk9cH
 Zv108lil9QJ5BCdb6ixqBty6WRNXjr5kJDWfOOuqMEnpRNfqj7k3wWp225i8wKJS
 XN+G8Vg0Tw6wtxDUbhFmc7b7zoGBosIHngnMFS09D+ZJM/mKPkpg3pnB7C4M36m+
 apIc2A/lqFaBK5cQ3TobowV+LcPduBDrzEJ/KgNqgeyzBj1/SgzZS4hDwZDUuh9i
 oJfIVEn2y4PdFv2whYUFA+qWqDDuBKUEN/15W03R+OVsDCU74Kw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1dd0b02
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 23:52:49 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id a13so4137930ilh.3
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 17:10:58 -0700 (PDT)
X-Gm-Message-State: AOAM533GRnkk5Q1YRfGaTT08rP2wGtGNHc5sqLprwxPh7W6e4m3aef2V
 JLwVzrFvkhmjs0bVxZLlJ78XQODieSPHQxjoNn4=
X-Google-Smtp-Source: ABdhPJy2h5AunhprwqcjoyyqPtopsCqLrJVMFt3kwtFSWtm+bMc/hy6IPb1sKRcrKx2stdKQmDaycSDU6CbDp3e/+yk=
X-Received: by 2002:a92:2515:: with SMTP id l21mr1511257ill.64.1592439057551; 
 Wed, 17 Jun 2020 17:10:57 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jun 2020 18:10:46 -0600
X-Gmail-Original-Message-ID: <CAHmME9oX=3ohm1duxrRYzk1kk0kSCBbb8N6fEohLZGAC-Vn2KQ@mail.gmail.com>
Message-ID: <CAHmME9oX=3ohm1duxrRYzk1kk0kSCBbb8N6fEohLZGAC-Vn2KQ@mail.gmail.com>
Subject: dkms packages for rhel/centos have returned
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Joe Doss <joe@solidadmin.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi folks,

We switched from dkms to elrepo's kmod a while ago. Unfortunately,
while kmod is convenient for some people, it's a disaster for others,
especially for folks using custom kernels. For that reason, Joe will
be maintaining his copr repo again for dkms packages, for el7 and el8.

<https://www.wireguard.com/install/#red-hat-enterprise-linux-8-module-kmod-module-dkms-tools>
has been updated to show both sets of instructions.

Jason
