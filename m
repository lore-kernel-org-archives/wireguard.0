Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B64606BAD6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ZDZr0U1/
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fba8c069;
	Tue, 10 Nov 2026 16:37:43 +0000 (UTC)
Received: from mail-pj1-x1065.google.com (mail-pj1-x1065.google.com
 [2607:f8b0:4864:20::1065])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ab446749
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 16:37:40 +0000 (UTC)
Received: by mail-pj1-x1065.google.com with SMTP id
 98e67ed59e1d1-3b17b277a68so173880a91.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 08:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794328659; x=1794933459;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:dkim-signature
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=mdHUO0VGLnueGxzHTpyhsQE1fh1WvgBQfjWRPSJDDzY=;
 b=EDiv+D9PrJ5Sh3nqYPKgp6/6ss1ly+QSP8tpC5+uy5Jfxmx09B1TZqeiPB724jG110
 Mbgkr4+rhDY1beNzvXe7v69DHePhnbVLg59o8vddn9JvS7RYhk3hjTqLdl7hM4AlDpZp
 P6RZVTWszR+s5ocZX3gzLwztXPmGQLzmBmkbUM/Yc/xUtsEo1QJLWlU7Hqd+rxvXyh2j
 U7zg7GqUQ4orpNBuQbvHM9DhjSzpm/bDKiKV+8cB1x8gamFn38thlRMBg6oaQ8+NaM1z
 05Z7P4p+jMrBDPVgcldQMatwwl8cBBxT/d2kMmXo/wq3ruEHRsFNvOFzQ5ScTM8tTvgW
 rM4A==
X-Forwarded-Encrypted: i=1;
 AL+hErFsEpb7iNEoPa2p0s93xS/jpncj+eYYtYnXTmZrt119wKxrcLm/ltlNnq1/KwpGc/tokvACM/WGTGo=@lists.zx2c4.com
X-Gm-Message-State: APuU4Z/KMZoJGfr0u0U7L53sWUDqu+roeAbyxaXdtgxiVipu6f9pbEVW
 8Ri5i22JlZEYnvvYPC/D9ls2iNG8+YxdpTbIS/2qbqkLsFnkRSvAxExkeWHQF1At8HwfvxK8vLl
 y2bl7yiWn9/3ED0RsRC9isI8wdXqN1EaWA5hL8+NqSA==
X-Gm-Gg: AYBFou10mg2hNPzSBQD6s+/1lXfhukn24/o2+vj585o7ZQCt5XRFMOUj8Vrs8v2LCbf
 etHqoTdJjBwINIXNRu5mX4r3Kd+Tp0XGZHQ14xODPBw6srA8JabhXfEg9abxfesjKR1vxZb4zzQ
 pIeo7EFWWbm/fPvoD9LoXLyErwsBXT6O2Sry4iprl2tDLn9KoftMC6uNWZpKMt+MmqV6ED88xG8
 8/mJxV6OcuVrfWn7lxQ8ZQzZ70q4iDkTCr5Pvb27A43H8/bOBpogQHpy8sdKiOOi/Yqhp/LZ3GJ
 yYNr9V81JCRH/2akKukOy+Pdvq7OiQbg7r3jlLvnkka3VkXsLS2XItedKVSVpPLy6PC1AofRaGw
 j9g==
X-Received: by 2002:a17:90b:4cce:b0:396:41d1:cbc7 with SMTP id
 98e67ed59e1d1-3b166aef2b6mr3328097a91.3.1794328658562; 
 Tue, 10 Nov 2026 08:37:38 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3b168f056e7sm995427a91.1.2026.11.10.08.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:37:38 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1794328654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mdHUO0VGLnueGxzHTpyhsQE1fh1WvgBQfjWRPSJDDzY=;
 b=ZDZr0U1/pHeEMipCNGli2iMRTX1nXQLbpRmDwcZEDOQ+B4SQBTWVNZw7weGFZUxjHl3Gs6
 CMtZfiW5dbFxczAM63Wv9EWm5qrgXInVmcuokvE6TMadLQ6zQieK0QropTRsBjZ8DRH+nq
 xTO39zvfYLBDk4s02DwIKPTGdFI373E=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 07eb770e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Nov 2026 16:37:33 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:37:31 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Andrii Pasichnyk <apasichnik9@gmail.com>
Cc: netdev@vger.kernel.org, wireguard@lists.zx2c4.com,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] wireguard: peer: free packets left on the per-peer
 queues on removal
Message-ID: <avNIS67grg_Qc5Vy@zx2c4.com>
References: <20261003201625.4572-1-apasichnik9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261003201625.4572-1-apasichnik9@gmail.com>
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
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 03, 2026 at 11:16:25PM +0300, Andrii Pasichnyk wrote:
> Reproduced with the WireGuard selftest VM (x86 KVM, 1 vCPU, net-next):
> remove a peer while a UDP flood keeps its receive queue busy, re-add it,
> repeat, then run the selftest's created/destroyed object check. Over
> 2140 removals the unpatched kernel leaked a peer and its keypair 5
> times ("wg0: Peer 27: merely created"); with this patch, 0 times in
> another 2140.

I'd be interested in seeing your adjustment to netns.sh so that I can
test this myself and validate various approaches. Do you have something
really minimal? Also, is this a test case that could be implemented
minimally enough that we could integrate this into netns.sh permanently?
