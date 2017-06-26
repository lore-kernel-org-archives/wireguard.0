Return-Path: wireguard@wut.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bacb953
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 08:03:08 +0000 (UTC)
Received: from opal.spod.org (opal.spod.org [217.135.32.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c5c5a82
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 08:03:08 +0000 (UTC)
Date: Mon, 26 Jun 2017 09:19:26 +0100 (BST)
From: wireguard@wut.to
To: Aaron Muir Hamilton <aaron@correspondwith.me>
Subject: Re: making wireguard work on RHEL7/etc.
In-Reply-To: <87o9tbuq7a.fsf@correspondwith.me>
Message-ID: <alpine.LRH.2.20.1706260917250.14074@bcny.fcbq.bet>
References: <alpine.LRH.2.20.1706241613350.14074@bcny.fcbq.bet>
 <87o9tbuq7a.fsf@correspondwith.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Aaron Muir Hamilton wrote:

> This is bizarre, isn't the current RHEL/CentOS/Scientific Linux 7 kernel
> a 3.10 series? Are these ifdefs only wrong on RHEL derivatives?
>

I think 'yes' to your second question.

RedHat seem to patch and backport excessively from various versions. I am
no expert so tried a bit of a brute-force approach to it.

Given how many people run RedHat derrived kernels, it's something you have
to put up with if you want people to use something.

There might be a better way of detecting it is RHEL
