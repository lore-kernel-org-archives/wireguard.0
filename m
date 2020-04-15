Return-Path: <SRS0=RTrd=57=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF428C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 21:42:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BF3C206E9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 21:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="f5a3LIg9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BF3C206E9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1279bc58;
	Wed, 15 Apr 2020 21:31:46 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6b427fc1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:31:44 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00fb7007
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=uFaAfvmo383PbY1q7BGNoY3Mtjk=; b=f5a3LI
 g9KxaBkherC7DFA+j2v1RdRzOGGVAJdw+A6sE8cjnAMAu5TdW6MkkuiF+oKOsijw
 fHx5dQ0YZ8VRUuraV/yrkSacojmUjkmzhFk6IZTXkNQ7C+Rmp0dpkI7S9m7gmF8h
 LS6VbWyjzNWQhk9vyAcV4/uukMOFOcmeZFM9HITuPW0LXJzcUaNdV/CA7ZdcsiAi
 tnZVNM/Yg3UmnJ8HPAGOgRTRYcoFcr8jsF505A2fhBotTrpwsmDD1wvobp3d7ekv
 eSuhERNvmEBA0BEySjnSy/qphK3yzmgmi6XU/ch2rJ5ehCQWNXy+4crUuDpWtwWj
 cqHu9XNGPfKaFsUA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1d70b9d6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:31:44 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id e127so3539185iof.6
 for <wireguard@lists.zx2c4.com>; Wed, 15 Apr 2020 14:41:44 -0700 (PDT)
X-Gm-Message-State: AGi0PubeBi7ncxbxCZteyXEby2RsUIQk5RbB3t/kC7Daf0O+2O3H/AAW
 aG7Wj6Fs3pA19c5OutESutbhuQVDIOZBZ6m3pZY=
X-Google-Smtp-Source: APiQypKqRuC9qoJSZAj9tnhAccL+lBNAwBpbP9U882CymcjsmoeL5DYADekql05htFpfhrlRfB4PQIteEr0QCUYXWEs=
X-Received: by 2002:a5d:9c16:: with SMTP id 22mr27109159ioe.79.1586986903544; 
 Wed, 15 Apr 2020 14:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200404211246.GA10066@zx2c4.com>
In-Reply-To: <20200404211246.GA10066@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 15 Apr 2020 15:41:32 -0600
X-Gmail-Original-Message-ID: <CAHmME9oWwW7qC_wzQ3JUE+CZF3eBzJG7v3x5RZww75H8pW+2tQ@mail.gmail.com>
Message-ID: <CAHmME9oWwW7qC_wzQ3JUE+CZF3eBzJG7v3x5RZww75H8pW+2tQ@mail.gmail.com>
Subject: Re: More reliable packages available for RHEL, CentOS, and Fedora
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

It turns out that ELRepo is a bit of a crumbling mess, unfortunately.
FOR CENTOS USERS ONLY, the instructions in the previous email need to
include:

$ sudo yum install yum-plugins-elrepo

Hopefully Red Hat will simply include WireGuard in RHEL 7 and 8, so
that we won't have to deal with this. But for now, this appears to be
the best we've got.

Jason
