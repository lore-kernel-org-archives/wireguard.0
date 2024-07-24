Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C4AC3DA4A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Aug 2024 16:20:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f076b0e;
	Fri, 2 Aug 2024 16:20:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cb6b517e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jul 2024 13:53:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A68B060AC7;
 Wed, 24 Jul 2024 13:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0F7C32781;
 Wed, 24 Jul 2024 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721829215;
 bh=07Vzl6re9ZHoHnUQaqXa2n0Sm3JNDNE/aQbliYyNUPE=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=WAP2//VlWUSM9jrjWrTnlUR5U9gfJcKWxfEehwSsgCifqJ1HhI5rmor2MgAYiE7Hj
 k3H3D8gUK01HrebDYiJ8EV56b+RO+InO4F1HL2zNXYqpPk0VVAstDY9HBgwUy8+jTo
 8Kp+cbZnfcsDTxUnkpS1wiQgO6T2KXSlCCZwyOB4EAFefvi0zRPKDPVqPNBGFqV5Kn
 m54HgAjJfy8we9Y9tl7LY7L4gaHz6KkuEz0NmtF8JUJfXUWPMHmL6c8XZgfCklah1Y
 U/SwoGTJa9N4jZ4SGcPsHczOthJTxHkGyBSbyg3+L/BrGVV8TCmbKAOKTgYYxrZSSF
 Ywifo4pkBnatw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id A535FCE0A6E; Wed, 24 Jul 2024 06:53:34 -0700 (PDT)
Date: Wed, 24 Jul 2024 06:53:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Uladzislau Rezki <urezki@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-block@vger.kernel.org,
 kernel-janitors@vger.kernel.org, bridge@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
 ecryptfs@vger.kernel.org, Neil Brown <neilb@suse.de>,
 Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
 linux-can@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 kasan-dev <kasan-dev@googlegroups.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <b3d9710a-805e-4e37-8295-b5ec1133d15c@paulmck-laptop>
References: <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
 <ZnCDgdg1EH6V7w5d@pc636>
 <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
 <ZnFT1Czb8oRb0SE7@pc636>
 <5c8b2883-962f-431f-b2d3-3632755de3b0@paulmck-laptop>
 <9967fdfa-e649-456d-a0cb-b4c4bf7f9d68@suse.cz>
 <6dad6e9f-e0ca-4446-be9c-1be25b2536dd@paulmck-laptop>
 <4cba4a48-902b-4fb6-895c-c8e6b64e0d5f@suse.cz>
 <ZnVInAV8BXhgAjP_@pc636>
 <df0716ac-c995-498c-83ee-b8c25302f9ed@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df0716ac-c995-498c-83ee-b8c25302f9ed@suse.cz>
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
Reply-To: paulmck@kernel.org
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Jul 15, 2024 at 10:39:38PM +0200, Vlastimil Babka wrote:
> On 6/21/24 11:32 AM, Uladzislau Rezki wrote:
> > On Wed, Jun 19, 2024 at 11:28:13AM +0200, Vlastimil Babka wrote:
> > One question. Maybe it is already late but it is better to ask rather than not.
> > 
> > What do you think if we have a small discussion about it on the LPC 2024 as a
> > topic? It might be it is already late or a schedule is set by now. Or we fix
> > it by a conference time.
> > 
> > Just a thought.
> 
> Sorry for the late reply. The MM MC turned out to be so packed I didn't even
> propose a slab topic. We could discuss in hallway track or a BOF, but
> hopefully if the current direction taken by my RFC brings no unexpected
> surprise, and the necessary RCU barrier side is also feasible, this will be
> settled by time of plumbers.

That would be even better!

							Thanx, Paul
