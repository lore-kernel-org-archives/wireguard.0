Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20A4C38A2D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Oct 2022 14:54:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 69045fea;
	Mon, 24 Oct 2022 14:54:50 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ad5d52c5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Oct 2022 00:32:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id x18so16042131ljm.1
 for <wireguard@lists.zx2c4.com>; Mon, 17 Oct 2022 17:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbell.dev; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3R7tAlL+14sckaCiM5eAhKfw2/HDcN6hFaUEwcGJyT0=;
 b=QnAntdef1ByLeWRv9q9+LFyO2kv+hjg9fZ5D3pl2Dp2BOHS2ZukfNm+UrcDcN+fR5g
 RVEzqiVw4SPJCu3XdagyG84PtTeWq2LbKtW1TwHqaRA01SCiBZBP8pap1FnDE9zOzlRA
 0lUORjcnZ8768E4RBhgE7tAe1MTY3iYeDFs1HiBfVM41cYsD1Zf3tU3m4bXI5aOpDJUh
 hnNGT3NijgHfEpJ0wr+TYV4sc2SHpvZdcHCNdgzaQKfwLhwmNZw19t068OfAhFgk+Uif
 r6WyfQ3+P0VgF3ko4yxwk2CjEi4snJWA3OeTc9Nsvqwa5Ir4VbUHFHVTeYQ9PInf6y/f
 gf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3R7tAlL+14sckaCiM5eAhKfw2/HDcN6hFaUEwcGJyT0=;
 b=6JG9+ti343fjZ0/POXr2n8NAzligu5OEodDWHiStPtuIU5qpAWX+A7TjQnFDxaCWKl
 va3cQbp8E1XLaR+lal7mK7bOIyeFLo/fjKrBl2Hpk9cb7dPiFs16keYZbOwXxosnbxOK
 4Eq+BZ6KKfDA9uuLw1fiN6eOtnY2OsPCAw9IJ++Iff15P/J3YZvjRYHJBRSPvYykljLI
 LDRYlKvDyhxkO8JVeuyN+lp8RIpnqnjsaGSOYKC7eYvf8wy7eV0WIu7JErJefBSH33qj
 tr/5GnxXtj+k7RHfM9G88G9I22B8GFRM1KqRnNSAR02GzU+b4HFBFhksEuDM71+a9rhC
 DANg==
X-Gm-Message-State: ACrzQf0XF2JSFjgSY1AW7wHKlel1bINhkwJjD96vBV4iP7vtet4IvGMD
 sSMf0Waqr8TNNwTdZDrMurs73/EObFS6SXQLz4ITt+XsEvsR5dTz
X-Google-Smtp-Source: AMsMyM4j6xSMMlh9kDBjfBylnQM82t1QsdUJHvhP70pK7pSAN35F8BkguTfBIQza1nw6Z5K6Zt9xln3WxY8iXu1CEIE=
X-Received: by 2002:a2e:7a12:0:b0:26f:b6a4:72de with SMTP id
 v18-20020a2e7a12000000b0026fb6a472demr125816ljc.387.1666053152390; Mon, 17
 Oct 2022 17:32:32 -0700 (PDT)
MIME-Version: 1.0
From: David Bell <david@dbell.dev>
Date: Mon, 17 Oct 2022 17:32:21 -0700
Message-ID: <CAFX_mq93MZn-csG=3uqr-g2xjnZT1rWD_Dfau=wtjF7FcGRmng@mail.gmail.com>
Subject: Improving Wireguard Throughput
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 24 Oct 2022 14:54:43 +0000
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

Hey all,

I'm investigating Wireguard as an alternative to mTLS in our
infrastructure and I'm trying to understand what's achievable in terms
of throughput and incremental cpu overhead, though at the moment I'm
focused on throughput.

We run 48 core machines with 25gbit NICs using the 5.10.113 kernel.
Benchmarking unencrypted traffic between hosts in the same dc achieves
line rate, and initially Wireguard was hitting ~2gbit. However, After
bumping up Wireguard's default MTU to 8920 I'm able to get to ~12gbit
throughput consistently over repeated benchmarks.

At this point I'm at a bit of a loss where to look for increasing
throughput. Independent results seem to be sparse for this kind of
workload, but looking at cilium's benchmark they were able to get
around 17.5gbit[0] with the following setup[1]. One thing I'm
wondering (probably incorrectly?) is whether we're being impacted by
Wireguard's lack of cpu affinity. Our NIC has 8 queues which are bound
to explicit cores, and my understanding with Wireguard is that
encrypt/decrypt handling is going to get splayed across all 48.

[0] https://docs.cilium.io/en/latest/operations/performance/benchmark/#wireguard-vs-ipsec
[1] https://docs.cilium.io/en/latest/operations/performance/benchmark/#test-hardware
