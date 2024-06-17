Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C4BC27C79
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 21:08:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 068c5c0a;
	Mon, 17 Jun 2024 21:07:59 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2af96a34
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 21:07:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E56CA1F395;
 Mon, 17 Jun 2024 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1718658477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhqD1JZCa8h9LMBNO3ezSkJWmrAJo6LNKwZwWzpwW1M=;
 b=j8DR5IyTlZofLM3Hvz795hVPWecqlsAUGRjaVX6rGmVl4s8wFxQjMCcsQeMN74lbbXwaaV
 hTN4M7Abcua5OS9vlrq6S6k1bjXyNwXWZn96drMcZpBy6IsfS0RnVhSQAk37i7IstTDUWp
 rpF3KkC5gtwzGDnovQkL5uqT0kkOzfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1718658477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhqD1JZCa8h9LMBNO3ezSkJWmrAJo6LNKwZwWzpwW1M=;
 b=kBTrNAKzCrUTsHKBNNdHM9fIefNunqMk9H0V2GRXVjqhJsp4yMpNQugUxDzwpIso8wl3sd
 3X3+6JzZgyYXBTDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1718658476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhqD1JZCa8h9LMBNO3ezSkJWmrAJo6LNKwZwWzpwW1M=;
 b=ExLPViHAvbM4j+i3e8gYnQrDA6vIdKvLTIxoCpcpkWQE2ZLqW4rwPiOg9UK5Wq/2VtWuYE
 4sQygQz4l2h2KSa2NL3yNM/h8QwPSPSgJSY+nSqXRmCM222DXJCtB+sJBz+r3s6hc7e0Sc
 3w6Tit18RpeR0sEumZnX+0dTL8N8c4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1718658476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhqD1JZCa8h9LMBNO3ezSkJWmrAJo6LNKwZwWzpwW1M=;
 b=WLqXyqYVgXmVxEHMGDdUcfDT4nZ30EJhWlenIyGCKj3KY+2QIEZ0Hm3PDge/OK6kv6R0Xe
 BryspmBkQnZmAQAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D268B13AAA;
 Mon, 17 Jun 2024 21:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MnYzMqulcGZ9SwAAD6G6ig
 (envelope-from <vbabka@suse.cz>); Mon, 17 Jun 2024 21:07:55 +0000
Message-ID: <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
Date: Mon, 17 Jun 2024 23:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
To: Uladzislau Rezki <urezki@gmail.com>
Cc: paulmck@kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jakub Kicinski <kuba@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org,
 bridge@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
 ecryptfs@vger.kernel.org, Neil Brown <neilb@suse.de>,
 Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
 linux-can@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 kasan-dev <kasan-dev@googlegroups.com>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com> <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com> <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
 <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
 <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz> <ZnCDgdg1EH6V7w5d@pc636>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <ZnCDgdg1EH6V7w5d@pc636>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-8.29 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com]; RCPT_COUNT_TWELVE(0.00)[29];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[kernel.org,zx2c4.com,inria.fr,vger.kernel.org,lists.linux.dev,efficios.com,lists.ozlabs.org,linux.ibm.com,csgroup.eu,gmail.com,lists.zx2c4.com,suse.de,netapp.com,oracle.com,talpey.com,netfilter.org,googlegroups.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLr583pch5u74edj9dsne3chzi)]
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

On 6/17/24 8:42 PM, Uladzislau Rezki wrote:
>> +
>> +	s = container_of(work, struct kmem_cache, async_destroy_work);
>> +
>> +	// XXX use the real kmem_cache_free_barrier() or similar thing here
> It implies that we need to introduce kfree_rcu_barrier(), a new API, which i
> wanted to avoid initially.

I wanted to avoid new API or flags for kfree_rcu() users and this would
be achieved. The barrier is used internally so I don't consider that an
API to avoid. How difficult is the implementation is another question,
depending on how the current batching works. Once (if) we have sheaves
proven to work and move kfree_rcu() fully into SLUB, the barrier might
also look different and hopefully easier. So maybe it's not worth to
invest too much into that barrier and just go for the potentially
longer, but easier to implement?

> Since you do it asynchronous can we just repeat
> and wait until it a cache is furry freed?

The problem is we want to detect the cases when it's not fully freed
because there was an actual read. So at some point we'd need to stop the
repeats because we know there can no longer be any kfree_rcu()'s in
flight since the kmem_cache_destroy() was called.

> I am asking because inventing a new kfree_rcu_barrier() might not be so
> straight forward.

Agreed.

> 
> --
> Uladzislau Rezki
