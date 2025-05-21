Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9FDC54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 23:16:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b9ec4ad;
	Wed, 21 May 2025 23:13:29 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 268ef25a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 May 2025 23:13:27 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-231ba912ba1so7431705ad.2
 for <wireguard@lists.zx2c4.com>; Wed, 21 May 2025 16:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1747869206; x=1748474006;
 darn=lists.zx2c4.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wKMJ2fz3N6fpkcvc501kYEjftfIcABz7h6kFhTzhFWo=;
 b=jTMJFNB0Kl0NXFY4OzWMz5v3NOzW8Lyoa9ydX8xa75cxXpLgNWZjdUte8p2m/MczOy
 gRmfojSDtTOSTH4Tu7iDWJj1PldZ3xLn1ZidPRnSascb8Bb3RB8X4Bk51j9oc5uzeXrx
 jhJACO5ioBvbdnYkme+XFHCZpzyAaoozY9hL6rWxauqOarYJ/ADSgRpbM338zF3lgjTA
 Uyv0ZSCeQREzY3Gsg5uwWYKWTtxJBDvXzLLRDmi67Mjk4pIxV5NLx0COgEO5/0heOxZg
 XsXiQhrEJFHdKK9S5ptPD5IlxVaBbCu6R+EKcjiDFFOcL0a7p0fl/vEqfBDg1qBZQGpa
 a0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747869206; x=1748474006;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wKMJ2fz3N6fpkcvc501kYEjftfIcABz7h6kFhTzhFWo=;
 b=vxvNBoWuxcQl0QdRakFqyg+CDlodu5ll82QCW2bRASFhSEjD7U56mb04IBejiyYRcv
 EBzMULKS0mZ96e8sO9kXLZbsmrDs7VAKTpODO2f1ehavsA0/o1zbIPp9UTF1LVoYQiyC
 p9H6NGtjkPNuQ6X8hwT4tO6cfpkLON8PYJEyNW4vFQ3NXIOBBzF2fglSrKudG5VFziPu
 EuTvtlJfmZ/F87gquj6d1Wx4Md+Oho+4pv+dqxfLLoYPwt59q/KsRPCtxFIrJHTFsIO4
 aceDp/PGI/tqwITLCDlr6hU9pUxw0ix6u9H86RqU3QUvJN9bnCN7iDueRXLicYpJOMVz
 5jZg==
X-Gm-Message-State: AOJu0YwzgO1OmLGn+GIonyy4UAPJZAPbT2ShawQdgcD3ZBxLELf9cPwr
 60j9PSeICpXk8ZzmH+nJYce7QRxchtO8Q7i0Hzyu/CqmSyBOS6atvKGfWD8s+gerF4kPctaTi6A
 Dq0b0x1I=
X-Gm-Gg: ASbGncs1DnGwCtzR6XhAeIxKe2tiijWvFrBeZFN9c5maAEkkAYkuSa5SGLHLsSRKM8z
 zhCCOH6cwumMcSyVAAigxoJkOrprl2qsnKUTYsORLUoQcJMCiPtjLJo+GtlLUxNKOcqIRf+q3IA
 jpxRU6a3skJyu/YND+S+vbO9MhRyJtuziTcqZddWeQbnn9y/W06kq4P24n00h2U1FQKy3jnE1n/
 Ua1SZNtBTdd7rZMeKYh7r3YBSc6vHY7wQELjQi3ljxagTxWSEFzGqU5u7uLh8WEPpAuiigOaeke
 eGw8xBin89mKJEql8qr1kSTOkApE4LKOpY5ukw==
X-Google-Smtp-Source: AGHT+IHJqsJtAdXfzDjopZWWI8xEjT0BiyBGtq9CFsmyZluNMt3NT7LTnT7qs3VJkkcckq91qpX16A==
X-Received: by 2002:a17:903:41d0:b0:22f:d4e7:e7ca with SMTP id
 d9443c01a7336-231d43b2377mr120368645ad.6.1747869205985; 
 Wed, 21 May 2025 16:13:25 -0700 (PDT)
Received: from t14 ([2607:fb91:1be5:f4d8:99e5:a661:f426:884c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ed2568sm97882475ad.214.2025.05.21.16.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 16:13:25 -0700 (PDT)
Date: Wed, 21 May 2025 16:13:19 -0700
From: Jordan Rife <jordan@jrife.io>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [RESEND PATCH v3 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
Message-ID: <p6wsy4m7obq3apegcxpgpp4wmjgahy2d7dzkjb6af46k4eptvt@dpxpfj7sst76>
References: <20250517192955.594735-1-jordan@jrife.io>
 <20250517192955.594735-2-jordan@jrife.io>
 <aC0PUO0V_osG_ZrN@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC0PUO0V_osG_ZrN@zx2c4.com>
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

On Wed, May 21, 2025 at 01:25:04AM +0200, Jason A. Donenfeld wrote:
> On Sat, May 17, 2025 at 12:29:52PM -0700, Jordan Rife wrote:
> > Introduce a new flag called WGALLOWEDIP_F_REMOVE_ME which in the same
> > way that WGPEER_F_REMOVE_ME allows a user to remove a single peer from
> > a WireGuard device's configuration allows a user to remove an ip from a
> > peer's set of allowed ips. This enables incremental updates to a
> > device's configuration without any connectivity blips or messy
> > workarounds.
>  
> Applied as:
>   https://git.zx2c4.com/wireguard-linux/commit/?h=devel&id=8f697b71a615c5dfff98fe93554036a2643d1976
> 
> And the userspace changes have been released already:
>   https://lists.zx2c4.com/pipermail/wireguard/2025-May/008789.html
> 
> Thanks for this! And sorry it took so long to get it applied. I'll send
> this up via net-next in a few days after a bunch of testing.
> 
> Jason

No problem, we all get busy :). Thanks for applying.

Jordan
