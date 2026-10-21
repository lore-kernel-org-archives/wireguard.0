Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C134F606A337
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 Oct 2026 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SMQFxkzS
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b269cd6c;
	Wed, 21 Oct 2026 09:37:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5f58e161
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 Oct 2026 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792575467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zYYaJ3Cx83d1i6W0tWGXSMXeldqRUTYijFYdQSWTCqk=;
 b=SMQFxkzSq/+0slfH3rITpdMlT8w550U6WKzvVBRSa9tbBtEYM88hD8GA4Wo6siYn5NdX9Y
 49c2VuLRtIyMQDbADd/FFHTgVf3GhpMR5h8rssoxQ63x3hxb0C37UV7GDNgEUBMqMSeB2g
 9UdP6yKxxylIw/j9DlXO7GlqsD86dDQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-_u7xX48KOf-yVVlOyNLt4A-1; Wed,
 21 Oct 2026 09:37:41 +0000
X-MC-Unique: _u7xX48KOf-yVVlOyNLt4A-1
X-Mimecast-MFC-AGG-ID: _u7xX48KOf-yVVlOyNLt4A_1792575460
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 826651800847; Wed, 21 Oct 2026 09:37:39 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb
 (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id D87471956087; Wed, 21 Oct 2026 09:37:35 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
 oleg@redhat.com; Wed, 21 Oct 2026 11:37:39 +0200 (CEST)
Date: Wed, 21 Oct 2026 11:37:34 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Allison Henderson <achender@kernel.org>
Cc: Joel Granados <joel.granados@kernel.org>,
 kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, rds-devel@oss.oracle.com
Subject: Re: rds_wq UAF
Message-ID: <atiH3sYO8XvnP-Vn@redhat.com>
References: <202610190310.9737b2e3-lkp@intel.com> <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes> <atYuE1xnVYe0BDG4@redhat.com>
 <atY42k00k0Waj6o4@redhat.com>
 <42964fa071bd8dcafd418c89be6d66856def4dc5.camel@kernel.org>
 <atdoGiW_sHlWgOwt@redhat.com>
 <e7888169bdc76ea40fcfe782c2bc9b70e037dfc6.camel@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e7888169bdc76ea40fcfe782c2bc9b70e037dfc6.camel@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 301VD25_kKdV3pWurgawP2bieTN8TgdjAfXVJxZULH0_1792575460
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21, Allison Henderson wrote:
>
> On Tue, 2026-10-20 at 15:09 +0200, Oleg Nesterov wrote:
> >
> > Let me try to summarize.
> >
> > If rds_init() fails after rds_threads_init() for any reason,
> > rds_threads_exit() will destroy/free rds_wq.
> >
> > If rds_rdma_init() is called after that, and rds_ib_init() fails
> > after rds_ib_mr_init(), rds_ib_unregister_client() will try to
> > flush the already freed rds_wq.
> >
> > But we have
> >
> > 	module_init(rds_init);		// net/rds/af_rds.c
> > 	module_init(rds_rdma_init);	// net/rds/rdma_transport.c
> >
> > and IIUC the order of these initcalls is not defined. So if
> > rds_rdma_init() -> rds_ib_init() is called before rds_init(), it
> > can do flush_workqueue(rds_wq) when rds_wq == NULL on failure.
>
> It is sort of defined.  When built as modules the order is enforced by
> symbol dependencies. rds_rdma and rds_tcp need symbols exported by rds
> (rds_wq itself is one of them), so they can't be loaded unless rds_init()
> succeeded.

Yes, somehow I forgot that rds_rdma depends on rds ...

> So the rds_wq == NULL case can't happen.

Well, in theory rds_threads_init() -> create_singlethread_workqueue() can
fail too and leave rds_wq = NULL. Nevermind.

> So I think the fix belongs at the transport init: if the core didn't
> come up, rds_rdma_init() and rds_tcp_init() should return early,
> before they register anything.  I can send that along with the
> sysctl change tomorrow.

OK, thanks.

Oleg.

