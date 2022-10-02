Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09282C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Oct 2022 23:35:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2ffce671;
	Sun, 2 Oct 2022 23:35:53 +0000 (UTC)
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0d971dda
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Oct 2022 23:35:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1664753747; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QI7Nb/YNx4sDMXwS5zbfscf2W1PxXk+fn2zbTvh9P4PNpadkz1gc4/TsXU5uoC31taNcjBRVy+IvgFVU52Mjdv9EFX39RoEy68zTSvHzOQKfZdxKYu2Wu3zrWND1zQhb7+4yO5ARxoZM2ipo6hJRAVtVBs1rPvgEtVY8mLgYldQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1664753747;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=e7Tk7BiIK4C+HNZ+AEq9L5ZYKT/ZQt/icGNpaNPAjoI=; 
 b=J39WZtxMMtt0s9L6NnzvUmwska16JBYSZvwIj5H+oSOzYyicgF3+EGw2mRpYPgTpNg6Liu+Zsyo+36ZiNM7Pt7mtYzM/SnkctVPS/XD5DnQVTjeICYU78c1WhW5DGWOcxV/YfZ8HVPefuqKH84VB5tSX8NrtvPtWkAZDEEJ0aoU=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=zoho.com;
 spf=pass  smtp.mailfrom=weichen302@zoho.com;
 dmarc=pass header.from=<weichen302@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to;
 b=n2ZU95N5wRFxYU/sej5rsvQDfemwCdgtvoff7ZxmsnjBfMplhUXcgHclElBusx+wr+oti7Wq3eRu
 I0T8/KUg4d7vOHOq6SCfupZopgMifKDAJeUYccy0+cohqgjSyNm1  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1664753747; 
 s=zm2022; d=zoho.com; i=weichen302@zoho.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=e7Tk7BiIK4C+HNZ+AEq9L5ZYKT/ZQt/icGNpaNPAjoI=;
 b=CcjM9b7miFkvSuV0cbVpq+NJigCi/2LVjDzH+NKraBQbRWmVEUedKD0mAgD/7CFT
 PmAcg1+paNCB3kOICBndT0DzTUUv8+3WS7iq2Nn+wSHcgUZ7jy0iE2ZijHlqbSOgZC9
 3Gn/U1L29SpUKBYTpa6d1VdzDBXV0FucbR+rXVIU=
Received: from tungsten (185.246.188.67 [185.246.188.67]) by mx.zohomail.com
 with SMTPS id 1664753746708984.5719116187939;
 Sun, 2 Oct 2022 16:35:46 -0700 (PDT)
Date: Sun, 2 Oct 2022 18:35:35 -0500
From: Wei Chen <weichen302@zoho.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Iptables WireGuard obfuscation extension
Message-ID: <YzogR3aHYMVscIO7@tungsten>
References: <183272e3203.12ada1173180167.8469340361616836666@zoho.com>
 <YzR3vcZhSjU2eRqB@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzR3vcZhSjU2eRqB@zx2c4.com>
X-ZohoMailClient: External
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

Hi Jason,

Thank you for the suggestions!

> - Instead of using siphash, if you can make use of 64 bytes of
>   randomness at a time, you might be able to get away with chacha8 (or
>   even lower). The input to chacha20 is typically a 256 bit key and a
>   nonce, but because we don't care about the cryptographic security here
>   -- wireguard handles that part -- we can play fast and lose, and make
>   our threat model, "would be too computationally complex to detect in
>   real time". Things become quite fun when you don't need real crypto.
>   To that end, we could perhaps get away with using chacha8 instead of
>   chacha20, and doing so with a 128-bit key. This then provides lots of
>   input to chacha:
> 

It does need more than 16 bytes. Currently it gets away with it by
borrowing one byte from where supposed to XOR with reserved field. If
the all zeros reserved field changes as WG protocol evolving, then this
siphash128 approach will stop working.

> - get_random_bytes() is slow if all you need is a byte at a time. That
>   computes 96 bytes and then throws away 88 bytes of it. Instead, you
>   can use get_random_u32(), which batches, and throw away 3 bytes. Or, I
>   think I'll add to kernel 6.1 get_random_u8(), which will waste
>   nothing.
> 
>   But actually, do you really need to do that? Can't you just run chacha
>   or siphash or whatever super fast non-cryptographic thing you have,
>   and just have an incrementing nonce? Or, better, since those keepalive
>   messages already have a suitably random poly1305 tag, just run siphash
>   on that, and discard if the resultant first byte is high/low/whatever.
> 

I have a feeling get_random_bytes() might not fast, but have no idea I
have wasted so many bytes. Thank you! I will try get_random_u32() first.

> - If this is to ever go upstream, you might want to add a `--obfs-type
>   N` parameter to the XT userspace library and the IPC struct, and make
>   it mandatory. To begin, everybody would use `--obfs-type 1`, since
> 

Added to todo list.


Wei
