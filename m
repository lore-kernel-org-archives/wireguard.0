Return-Path: <SRS0=J4Yg=GQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76069C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:52:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C912233EA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C912233EA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f656f703;
	Wed, 13 Jan 2021 16:50:11 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [167.71.246.149])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 332c3c53
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1610556601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFG2nNC2PHz4AjFzS/olB151hh2GU1udBfJvKYumK7M=;
 b=GPBefCB5jVodRJJfx4v97Wxua+bQygMMs00+PVVtJZPi2C7ILQnN3F6eql9lgvZ1ZJmJG7
 phmbd7sCSr/WfyV25Ct7n30fjJWpLdLYar0nJ9uYxfz/kaBnqwj5VtnvHHy/gGS+sMPiFz
 WUErj+nHZx7C3hLipYje6SyRceHfHAg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7d801cd2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 16:50:01 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id c7so2576916qke.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jan 2021 08:50:00 -0800 (PST)
X-Gm-Message-State: AOAM532NqHcUAhehDQz9Cw56gMI+0JcDTJ24lTohfwXClf4yma1npqD3
 lAyajIhpK5xfN3VhL4b8TRbJWi3raD/stM31v58=
X-Google-Smtp-Source: ABdhPJxUqIOfPiIkbOL40a0AsSnKDRp7AVdpC4rff21QQn39J4ry1MTGKXGCStiSV0TGMD6YsTVScJS/SOjDTBJ+gic=
X-Received: by 2002:a25:880a:: with SMTP id c10mr4436497ybl.456.1610556600344; 
 Wed, 13 Jan 2021 08:50:00 -0800 (PST)
MIME-Version: 1.0
References: <X/8aDfdkod+rCPqK@zx2c4.com>
 <33997a3d-591e-9aa3-92fe-a06a4d3c5b26@gmail.com>
 <CAHmME9rbUbEZah0MDtdRXhUxMtOSrcdo4BCN1LY-iDtXUWHy5Q@mail.gmail.com>
 <87v9c09450.fsf@toke.dk>
In-Reply-To: <87v9c09450.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jan 2021 17:49:49 +0100
X-Gmail-Original-Message-ID: <CAHmME9rMJ2R3X0iUdYZhGfL6+J0xRyrnvmBws-6T4itP0tZFmA@mail.gmail.com>
Message-ID: <CAHmME9rMJ2R3X0iUdYZhGfL6+J0xRyrnvmBws-6T4itP0tZFmA@mail.gmail.com>
Subject: Re: network namespace wireguard routing [Was: Re: Userspace
 Networking Stack + WireGuard + Go]
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: Julian Orth <ju.orth@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jan 13, 2021 at 5:46 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> 5. also requires CAP_SYS_ADMIN (and I think by extension, so does 3.,
> and 4.). From 'man setns':
>
>        Network, IPC, time, and UTS namespaces
>               In order to reassociate itself with a new network, IPC,
>               time, or UTS namespace, the caller must have the
>               CAP_SYS_ADMIN capability both in its own user namespace
>               and in the user namespace that owns the target namespace.

For this, you just create a new user namespace first. You can try it
yourself from the command line:

zx2c4@thinkpad ~ $ unshare -n
unshare: unshare failed: Operation not permitted
zx2c4@thinkpad ~ $ unshare -Un
nobody@thinkpad ~ $ ip a
1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
