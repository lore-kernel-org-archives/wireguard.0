Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B857606A31D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QGL5IypQ
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 95457055;
	Mon, 26 Oct 2026 05:29:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e262d012
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Oct 2026 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792494314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fLmuyTfd7g4VErTxnTfok7Jz/5L33bdb9HtzrWwzsMQ=;
 b=QGL5IypQIZjEcW6EZVvHfb3mUlynOPnUcGFIRbtKG56nCW/MCJRrAYpxisij1TC8bM9A5h
 IkDl6IwiPVZ31rduHugxi86MJy98Jbf8ztED7/uCmjjOiplz8RiWjEM4OcxuGjiTQavgPI
 ZoW7FbHEYABiT7xNktOWENu6q64Xcjw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-m21zt0reOCemHoMKFmPGmQ-1; Tue,
 20 Oct 2026 11:05:08 +0000
X-MC-Unique: m21zt0reOCemHoMKFmPGmQ-1
X-Mimecast-MFC-AGG-ID: m21zt0reOCemHoMKFmPGmQ_1792494306
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0F981180256B; Tue, 20 Oct 2026 11:05:06 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb
 (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id 8D09318002B1; Tue, 20 Oct 2026 11:05:02 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
 oleg@redhat.com; Tue, 20 Oct 2026 13:05:05 +0200 (CEST)
Date: Tue, 20 Oct 2026 13:05:01 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Allison Henderson <achender@kernel.org>,
 kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, rds-devel@oss.oracle.com
Subject: Re: [linus:master] [sysctl]  8d75c338f0:
 BUG:KASAN:slab-use-after-free_in_touch_wq_lockdep_map
Message-ID: <atdK3ZkT4YqjGICq@redhat.com>
References: <202610190310.9737b2e3-lkp@intel.com> <atYB0bm9eEXp8A2g@redhat.com>
 <atYW0K3t57puHeLW@hobbes> <atYuE1xnVYe0BDG4@redhat.com>
 <atY42k00k0Waj6o4@redhat.com>
 <42964fa071bd8dcafd418c89be6d66856def4dc5.camel@kernel.org>
 <atdE-TB8hkqcwp6g@hobbes>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <atdE-TB8hkqcwp6g@hobbes>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: N5IkE4FcomPGrmHkjtnrTEnLapJjGR2NikTs3penmQE_1792494306
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 26 Oct 2026 05:28:33 +0000
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

On 10/20, Joel Granados wrote:
>
> On Mon, Oct 19, 2026 at 12:52:58PM -0700, Allison Henderson wrote:
> >
> > CONFIG_SYSCTL=n.  A simpler fix might be to just handle the NULL at the
> > three call sites, e.g.:
> >
> >         rds_sysctl_reg_table =
> >                 register_net_sysctl(&init_net, "net/rds", rds_sysctl_rds_table);
> >         if (!rds_sysctl_reg_table && IS_ENABLED(CONFIG_SYSCTL))
> >                 return -ENOMEM;
> >
>
> Remember to NULL check rds_sysctl_reg_table in rds_sysctl_exit(). You
> might hit another UAF on exit if you don't.

Why? unregister_sysctl_table(header) does nothing if header == NULL.

Oleg.

