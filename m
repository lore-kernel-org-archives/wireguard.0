Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D43C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:27:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C4720578
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PMRE9MFB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1C4720578
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69cc3009;
	Tue, 14 Apr 2020 08:03:52 +0000 (UTC)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [2607:f8b0:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2c624bdb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 00:20:15 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id h69so2689619pgc.8
 for <wireguard@lists.zx2c4.com>; Mon, 13 Apr 2020 17:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=GtP40NBc6K+wY7TevCqJVJVyGGxw6eyhk3x6njvRZbI=;
 b=PMRE9MFBjRNguCLZJxvQ0tC6cbj5HN/L0mNJHOjg1H5naWvyPaji8Uw6CjXqOQ2azW
 MhWs/LuNrHlvICFisvb7Cy6SJ3VKQrmiHJlokad5hGoOXcGXzDY3vorrrgpyAZrAVUDE
 dUN76VdbMCLvs9G10TRyVoj/R2uKEUPKhrkRhwWPh9Qq6Oj8zqhrDAXwnWHye+K8R3ym
 lDZQumSHVx6+RupP9U0o1EyjztcXPr7zTXefIIyzd+nYkxQBJg3bKkumuWN4k6N/hrZC
 eN210smaNX58gX6QVglgalvDGfi5xzWfnOSt7/cWPG1d3xQeaexIo7gZ03EO3NRYAH/8
 2wUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=GtP40NBc6K+wY7TevCqJVJVyGGxw6eyhk3x6njvRZbI=;
 b=dCiyTRhIsuV1xolsfUxcAc7UQ9HSPUcQ0pZLWX1vs1jE3bBAOv4RVObO9LPqbFnmYo
 VX4Wa7KLFaPdu4APfstUSNPIevX75tiYZ8Doot5HMW5y/maYrPP/L3K8MuaIz5Heq5E0
 dDVeVwLRfMRLyrnBwyp+0aTebnDLQgMYjOxM/kD/yEBaPu+xjILDAMkpD9u5hqBzDYnZ
 U91Uskh/eBM+1NRcJU+RrXDtkdhYlT1wMV5Sgx0Za8P13VBmVuSMnn4XgLAwH/EWDB2R
 vPOwLbAoWgp4kFIL5WjjZUewQzJqgdzPEpbi/l+AogDBxOKUK9y2pkB6MSLIUplDKbhx
 0o+w==
X-Gm-Message-State: AGi0PuYu5//+qNtND5iCjRzEDdeybGfIN/2aE/hVgklzmONcwKNog+k5
 cke/v7VO8vVwv3VHuBhOSpUhqA==
X-Google-Smtp-Source: APiQypL5W5g7xmsU3GZXO1UecYYPwVLK1dPD412glciRM3pdZ8NSkRu/LjnNHn8Pg6Fxg4L/cgCpIw==
X-Received: by 2002:a62:dd48:: with SMTP id w69mr10144721pff.86.1586824199909; 
 Mon, 13 Apr 2020 17:29:59 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id g11sm10055136pjs.17.2020.04.13.17.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 17:29:59 -0700 (PDT)
Date: Mon, 13 Apr 2020 17:29:58 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Waiman Long <longman@redhat.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>, 
 linux-mm@kvack.org, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
 x86@kernel.org, linux-crypto@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org, linux-ppp@vger.kernel.org, 
 wireguard@lists.zx2c4.com, linux-wireless@vger.kernel.org, 
 devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, 
 target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-fscrypt@vger.kernel.org, ecryptfs@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-bluetooth@vger.kernel.org, 
 linux-wpan@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
 cocci@systeme.lip6.fr, linux-security-module@vger.kernel.org, 
 linux-integrity@vger.kernel.org
Subject: Re: [PATCH 1/2] mm, treewide: Rename kzfree() to kfree_sensitive()
In-Reply-To: <20200413211550.8307-2-longman@redhat.com>
Message-ID: <alpine.DEB.2.21.2004131729410.260270@chino.kir.corp.google.com>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413211550.8307-2-longman@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Tue, 14 Apr 2020 10:03:41 +0200
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

On Mon, 13 Apr 2020, Waiman Long wrote:

> As said by Linus:
> 
>   A symmetric naming is only helpful if it implies symmetries in use.
>   Otherwise it's actively misleading.
> 
>   In "kzalloc()", the z is meaningful and an important part of what the
>   caller wants.
> 
>   In "kzfree()", the z is actively detrimental, because maybe in the
>   future we really _might_ want to use that "memfill(0xdeadbeef)" or
>   something. The "zero" part of the interface isn't even _relevant_.
> 
> The main reason that kzfree() exists is to clear sensitive information
> that should not be leaked to other future users of the same memory
> objects.
> 
> Rename kzfree() to kfree_sensitive() to follow the example of the
> recently added kvfree_sensitive() and make the intention of the API
> more explicit. In addition, memzero_explicit() is used to clear the
> memory to make sure that it won't get optimized away by the compiler.
> 
> The renaming is done by using the command sequence:
> 
>   git grep -w --name-only kzfree |\
>   xargs sed -i 's/\bkzfree\b/kfree_sensitive/'
> 
> followed by some editing of the kfree_sensitive() kerneldoc and the
> use of memzero_explicit() instead of memset().
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Waiman Long <longman@redhat.com>

Acked-by: David Rientjes <rientjes@google.com>
