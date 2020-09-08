Return-Path: <SRS0=wFle=CR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4C7C43461
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Sep 2020 15:26:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073C9222EA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Sep 2020 15:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VuAkIlIt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 073C9222EA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bae97a6;
	Tue, 8 Sep 2020 14:57:19 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id daf559f1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Sep 2020 14:57:17 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f650941b
 for <wireguard@lists.zx2c4.com>; Tue, 8 Sep 2020 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=7N+w6kF7E0t5Uk3YN/81VBi5JP8=; b=VuAkIl
 Itj15IoZZINWbVlMfqt095SNhfstPxIdR6wCEt20s57hwB4f4rqo3Qc0yB6QHyTX
 dVjiyrTW5xs1xYlPvR7fVQ7GVhW0AwTw3KuxxFlovgIXnzUknqj46uvE6DP1z1Mf
 AgAzDXSZ51xmQQ8PDAOV3z9SzvhEWiKLE4WP4ETBL7qpfPIsB4AygmzTFzBd6NnZ
 ovWVeaLmXS0x564P24DaHk/FmMRhhWQCjx/h603GRtc4H0UwhD16J6B04EaBiC3o
 ruDnrMIPdSfV3CNhKUs0JG0RY0DbH+0xR67Dqg+jNUMNK0KIfwOur4YlAQhRLFLu
 U7E2fCG+JL6mDtvw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 078798cb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Sep 2020 14:57:15 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id z25so17469254iol.10
 for <wireguard@lists.zx2c4.com>; Tue, 08 Sep 2020 08:26:09 -0700 (PDT)
X-Gm-Message-State: AOAM531SRTGaIuot6vcJBugCHiOSux3Qo7XTJM3doFYCqrCKY5oi5Gub
 LWh+1ppiF/21M2IK2vR8UOIG1o+eBA2BZbmUVR0=
X-Google-Smtp-Source: ABdhPJw9Fax3meqqSqqUE1/U9G0Fj74FgZShwJy2QUoc8l2nSwvdSkxd/y/U0NP2RxNtMkno7Plyroz+rmnjcspNDrc=
X-Received: by 2002:a6b:7112:: with SMTP id q18mr21017767iog.79.1599578768890; 
 Tue, 08 Sep 2020 08:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200908145911.4090480-1-edumazet@google.com>
In-Reply-To: <20200908145911.4090480-1-edumazet@google.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 8 Sep 2020 17:25:58 +0200
X-Gmail-Original-Message-ID: <CAHmME9qG6ceo+ZYncHOJ1+PE_bv74suN5LAv1gFUTHaBy31p7A@mail.gmail.com>
Message-ID: <CAHmME9qG6ceo+ZYncHOJ1+PE_bv74suN5LAv1gFUTHaBy31p7A@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: fix race in wg_index_hashtable_replace()
To: Eric Dumazet <edumazet@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, 
 Eric Dumazet <eric.dumazet@gmail.com>, syzbot <syzkaller@googlegroups.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey Eric,

On Tue, Sep 8, 2020 at 4:59 PM Eric Dumazet <edumazet@google.com> wrote:
>
> syzbot got a NULL dereference in wg_index_hashtable_replace() [1]
>
> Issue here is that right after checking hlist_unhashed(&old->index_hash)
> another cpu might have removed @old already from the hash.
>
> Since we are dealing with a very unlikely case, we can simply
> acquire the table lock earlier.

That's a nice bug. It looks like this is triggered by a teardown race,
when wg_index_hashtable_replace races with wg_index_hashtable_remove.

Since all the other hashtable mutator functions are protected by that
spinlock, it doesn't seem harmful to fix this by doing the same, even
if formally that spinlock is supposed to protect hash bucket heads
rather than entry pointers.

I'm playing with your patch and a variant of it, which I'll have
queued up in my tree in the next hour or so.

Thanks a lot for triaging this.

Jason
