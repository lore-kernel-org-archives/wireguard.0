Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6CB606A31C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 Oct 2026 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E+jqSW/t
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c18be36b;
	Tue, 20 Oct 2026 13:10:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c6736bcf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Oct 2026 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792501797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r7db5+BopgpcFDUxO3SJq0ATIR0htP6s/SGZniIH6PQ=;
 b=E+jqSW/tFnyhl8oQW42X5FBHi8aFnsN+oKNEBakDpbjuemVOgapS0puoX8pZxnJM7dIYjW
 6NaGr5nH50J6e9xZ5JIT2aTL1d+7FFic9LQMaeqsDD/FGWUyvQUQa+Y4QMcdus9yQUV2No
 rqs4dc3GOH9QEfkymWxUwMOXTmREiUw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-GjRzZyDDNB-mlwpQ4uaVZg-1; Tue,
 20 Oct 2026 13:09:53 +0000
X-MC-Unique: GjRzZyDDNB-mlwpQ4uaVZg-1
X-Mimecast-MFC-AGG-ID: GjRzZyDDNB-mlwpQ4uaVZg_1792501791
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B2A641954B14; Tue, 20 Oct 2026 13:09:50 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb
 (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id 5CDEB362; Tue, 20 Oct 2026 13:09:47 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
 oleg@redhat.com; Tue, 20 Oct 2026 15:09:50 +0200 (CEST)
Date: Tue, 20 Oct 2026 15:09:46 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Allison Henderson <achender@kernel.org>
Cc: Joel Granados <joel.granados@kernel.org>,
 kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, rds-devel@oss.oracle.com
Subject: rds_wq UAF
Message-ID: <atdoGiW_sHlWgOwt@redhat.com>
References: <202610190310.9737b2e3-lkp@intel.com> <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes> <atYuE1xnVYe0BDG4@redhat.com>
 <atY42k00k0Waj6o4@redhat.com>
 <42964fa071bd8dcafd418c89be6d66856def4dc5.camel@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <42964fa071bd8dcafd418c89be6d66856def4dc5.camel@kernel.org>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: DaAWgr8gLGlzmEHv9Ps6ZZwm_T7mDIzXH9qUTzRaOrs_1792501791
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

(change subject)

On 10/19, Allison Henderson wrote:
>
> On Mon, 2026-10-19 at 17:35 +0200, Oleg Nesterov wrote:
> > >
> > > But. rds_init() can also fail even if CONFIG_SYSCTL=y, after
> > > rds_sysctl_init(), so to me this looks like a bug in net/rds/.
> > >
>
> Yes that's a separate bug, so I'll send a separate fix for that.

Let me try to summarize.

If rds_init() fails after rds_threads_init() for any reason,
rds_threads_exit() will destroy/free rds_wq.

If rds_rdma_init() is called after that, and rds_ib_init() fails
after rds_ib_mr_init(), rds_ib_unregister_client() will try to
flush the already freed rds_wq.

But we have

	module_init(rds_init);		// net/rds/af_rds.c
	module_init(rds_rdma_init);	// net/rds/rdma_transport.c

and IIUC the order of these initcalls is not defined. So if
rds_rdma_init() -> rds_ib_init() is called before rds_init(), it
can do flush_workqueue(rds_wq) when rds_wq == NULL on failure.

With or without CONFIG_SYSCTL. Right?

But it seems that rds_ib_init() doesn't need to flush rds_wq on failure,
so how about the patch below? Of course, I have no idea if net/rds has
more similar issues with rds_wq.

Oleg.
---

diff --git a/net/rds/ib.c b/net/rds/ib.c
index 786f39169bc1..cde2d1bfabbd 100644
--- a/net/rds/ib.c
+++ b/net/rds/ib.c
@@ -619,7 +619,7 @@ int rds_ib_init(void)
 out_sysctl:
 	rds_ib_sysctl_exit();
 out_ibreg:
-	rds_ib_unregister_client();
+	ib_unregister_client(&rds_ib_client);
 out_mr_exit:
 	rds_ib_mr_exit();
 out:

