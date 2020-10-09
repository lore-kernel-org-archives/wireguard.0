Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DA9C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:03:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBD022261
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 14:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LKJGEU5A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FBD022261
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 770bcc15;
	Fri, 9 Oct 2020 13:30:09 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 996da14e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 13:30:06 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cfca00a
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+rANbphK+P+TE5OCFsB2kCNEgZA=; b=LKJGEU
 5AcbUrq/BrZW8cY5jhe1OFKsxEExQ6dHdjpqGV7O9fbLKaL062MDaAnTHpKdHz+s
 6w4Ace5EDWxSuakozGakWNV3BsqnEq1VHxthiVe25EjwHkbFSWc6bGlQ3F8nKtRG
 JjZJQR03Gy2co1SieiEvxQDRTbFX6V5nijWTE8FOjBTpj9NP1CBpRPEFinSCzpdA
 GBuX8JuSGz0RNplN6203muwtfC/3DJTuQgSxCjxhR6uXJezI1s5c4pQCn8Mp4UiJ
 31lVHvVQ3fiHdY5u7DS/RT72Q8E+NUpWPvALMjZPZPAgK2G33YV/B/kup9I4bsJw
 WRM+zZMWjUZknqJA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ae6a81d2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 13:30:05 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id k25so10184811ioh.7
 for <wireguard@lists.zx2c4.com>; Fri, 09 Oct 2020 07:02:58 -0700 (PDT)
X-Gm-Message-State: AOAM530fk8KMrscIh1GPzPdT3O6wY7K5hhvrm/vSpBNg1zBCNGiwqZKY
 WldIdYFqPB8sBwawiHNoy19MAwSBN+x6j7nNofk=
X-Google-Smtp-Source: ABdhPJzBQs7Fk8XT+VNKZFdWYf4rjuTSjJKKQzKi354Ou1thwU5m70wYRuZVno1wbBucm6hvkEZctcHsUnzpukLmyjE=
X-Received: by 2002:a05:6638:12cc:: with SMTP id
 v12mr6376559jas.75.1602252178356; 
 Fri, 09 Oct 2020 07:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <etPan.5f80552b.45639067.8db@ovpn.com>
 <CAHmME9rTGWNuS=AOj_jUnC7QvWW1od5jmJcvLurA-oukFiwf=g@mail.gmail.com>
 <etPan.5f806950.26ad9721.107c@ovpn.com>
In-Reply-To: <etPan.5f806950.26ad9721.107c@ovpn.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Oct 2020 16:02:47 +0200
X-Gmail-Original-Message-ID: <CAHmME9riJ2Mi6FEw5+kftUFqBOmm+i7dZH-jrwPOg-hZ1VQ0PA@mail.gmail.com>
Message-ID: <CAHmME9riJ2Mi6FEw5+kftUFqBOmm+i7dZH-jrwPOg-hZ1VQ0PA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Samsung_Galaxy_S10e_can=E2=80=99t_reach_local_devices_?=
 =?UTF-8?Q?in_network?=
To: David Wibergh <david@ovpn.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hmm, from that command output, I'm still not quite sure. The most
significant difference I can see from casual inspection is:

Sony:
19000:  from all fwmark 0xcd/0x1ffff iif lo lookup 1026
21000:  from all fwmark 0xce/0x1ffff lookup 1026

Galaxy:
19000:  from all fwmark 0x2ad/0x1ffff iif lo lookup 1017
21000:  from all fwmark 0x2ab/0xffff lookup 1017

Is the galaxy missing a leading 0x1 in the mask of that second rule there?

What do you get on each when you run `ip route get 10.220.0.4`? Same
thing or is it different?

I also noticed that on the Galaxy, there's a direct route to some
telco server -- `90.132.128.59 via 10.220.0.1 dev wlan0 table 99 proto
static`. I didn't see this direct route on the Sony. I doubt it's
related to the above, but I've also never seen this before and wonder
if it's some VoLTE/VoWIFI hand-over trick in recent Android networking
stacks.
