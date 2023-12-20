Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D35BC3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 07:15:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0958b76f;
	Wed, 20 Dec 2023 07:15:05 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ca1fc7e9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Dec 2023 07:15:03 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d3e416f303so6914175ad.0
 for <wireguard@lists.zx2c4.com>; Tue, 19 Dec 2023 23:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703056501; x=1703661301; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=eJqWdKRl0UBq0Wj+r8chL9QmhrnrulM60eoe1tH98KY=;
 b=jEs+s4NoxhKv0um/z5z5ekMEl7Ge8WDFtLh49vfKjuPIdFyZNk4tBTrfQVrCiqx6jx
 SILlCEvAxmw0jJCAWdXxQ7Bl19JXO89uCwT22OLessk3IA0Ehwj0I9V/kW1STPUo3lyW
 d1KS7EwLcehHYpp4CKplOfLqymulfMB5nI1w+8R+x0qSK1wvmrDxnwftWwqiBkLFk3qd
 VaJGVXdVjcl9FF18eHYTMIVJCbi8skiD2D/bnKLlfyrLnDQzFR/RWftdgqbomhZmu3yf
 V82en/x/TrNB+5IQ3HBodUdACmWqF7oT8yWeyAVR7hTLzkhC8GS7sORQ4MPWFgy9xAp+
 1lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703056501; x=1703661301;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJqWdKRl0UBq0Wj+r8chL9QmhrnrulM60eoe1tH98KY=;
 b=r6w/q5QVMnoVOp3UXGVpzQicTRkPe8F63qeURiD+89QnuT73JvEzKZ/5bdgNKp3Hmt
 GsBuFaOJ8Tx1G2+lPVp5oE6fNcsUNe0jvyqTmmzqvGuPBiV2sPLfMLEuE4KvWAf9sK58
 8CJxRfV5zAjKRPeT1MkH0wOQNOZj/DRTp5SjibIKjWwK6qFzXyl6pXeqHO+xL2OQsbSc
 XJ1IioO7+J9fZBfCuG4DyDj23veolHubhQIvcJcVBU013HOjhrW76QE4Pw6wOMlSX/HN
 H+ZHu4AUWjIPXnk/H7rruZikL6BadyIDN9Bq6f43LcOFmqLEdqj2dEWdi8SBABxkcj8K
 WtFQ==
X-Gm-Message-State: AOJu0YyA4k2q92wxdJl81Tr/cbVQo6nOLr0mbk+akYFimY7zogtSjGVH
 KPnnMOL8FaM3wPh31s9Tk1E=
X-Google-Smtp-Source: AGHT+IH2/KQGWsEEIk+CfQb//I/X1FN9i9PYn0R8hU2YQDfX0MobECujamcRsnvnV4o1L8WIa9T7SQ==
X-Received: by 2002:a17:903:947:b0:1d3:be34:7862 with SMTP id
 ma7-20020a170903094700b001d3be347862mr3583611plb.9.1703056501427; 
 Tue, 19 Dec 2023 23:15:01 -0800 (PST)
Received: from localhost (dhcp-72-253-202-210.hawaiiantel.net.
 [72.253.202.210]) by smtp.gmail.com with ESMTPSA id
 m2-20020a170902bb8200b001cfd2cb1907sm22210314pls.206.2023.12.19.23.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 23:15:00 -0800 (PST)
Date: Tue, 19 Dec 2023 21:14:59 -1000
From: Tejun Heo <tj@kernel.org>
To: Naohiro Aota <Naohiro.Aota@wdc.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gfs2@lists.linux.dev" <gfs2@lists.linux.dev>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, 
 "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ntb@lists.linux.dev" <ntb@lists.linux.dev>,
 "open-iscsi@googlegroups.com" <open-iscsi@googlegroups.com>,
 "oss-drivers@corigine.com" <oss-drivers@corigine.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Performance drop due to alloc_workqueue() misuse and recent change
Message-ID: <ZYKUc7MUGvre2lGQ@slm.duckdns.org>
References: <dbu6wiwu3sdhmhikb2w6lns7b27gbobfavhjj57kwi2quafgwl@htjcc5oikcr3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbu6wiwu3sdhmhikb2w6lns7b27gbobfavhjj57kwi2quafgwl@htjcc5oikcr3>
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

Hello, again.

On Mon, Dec 04, 2023 at 04:03:47PM +0000, Naohiro Aota wrote:
...
> In summary, we misuse max_active, considering it is a global limit. And,
> the recent commit introduced a huge performance drop in some cases.  We
> need to review alloc_workqueue() usage to check if its max_active setting
> is proper or not.

Can you please test the following branch?

 https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git unbound-system-wide-max_active

Thanks.

-- 
tejun
