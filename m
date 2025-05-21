Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810BDC54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 23:02:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3cc1708;
	Wed, 21 May 2025 23:02:37 +0000 (UTC)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 07e95f33
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 May 2025 23:02:35 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-47745b4b9aaso13467361cf.0
 for <wireguard@lists.zx2c4.com>; Wed, 21 May 2025 16:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1747868554; x=1748473354;
 darn=lists.zx2c4.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zLwug4uI+PE02xat/Kemu8WKBjO4HhVajXJFphtRoKQ=;
 b=EQp1bJSRSoTsL+DfTAFadOyQMUfZqp0QWGSa5+5cgXCfRNAHDLyrREEn4y+Y5x2IiT
 aVRT2Y+DP6KVesEEUdy0+Is57jGZur9ERdx2o/EusxMFfuDudgx0oTzEa0r/o7/YicDX
 oVO3wX4xcQOP+p/TUZwAvp/ivs2zGmV3jwINBhQ3M7n1Z7KPz2F1EBd7nMX8R36l5uqI
 ir3CImN+/XKEKpSindyj0NtBFIv0w1rg4MvC5Cv1lGkqwzyaTzxLpiSCXwn2P8Ivy0it
 5EJwn2nXUUu+mh8WgkI/9U4YYvoeh3lxiC4xFvFRbnKU9iDB4kxYg0U+ywHscUFgYW2Z
 LUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747868554; x=1748473354;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLwug4uI+PE02xat/Kemu8WKBjO4HhVajXJFphtRoKQ=;
 b=sZXg5O7Vd8gH44cqfZ6NDtlKNcM2+QWyDf8QxJ7ev4vxWtO8hsdiIYOiAvydVUvaib
 e4gLLUGK7nBePFae8xg4DBVk7ZFf3VdiFLN5dUTNUz/DrSzJaEo3scWyZ3YEowzR4th7
 uLSAcxNzt2/B1GlVSUYjgD55x6g9Bs5K93Opv2zY/fLbZ4e6IE8rcr5slE/IfDsEZ/Q3
 LS/ih9CQLJ/4fQy05VLXkA1Uh/FkceWs0h3Jn1SlWqZASZl51A2jwQJVy+IuE1I2RRtz
 3zgT+b5W5jc5IS/5GDhny2c+HevAXQxy8moHwRx7hbURIIlVQK+D7F4byY3d2qOoDtWZ
 ee9Q==
X-Gm-Message-State: AOJu0YzR7RzffSaHPrAhrfx8lPUQHRJU1ZkCDu/5FImwNMHmtTkExRFN
 eMemAVq3k/nh50f52cscZOVTwDhtn1bGiO1PhfEUO6agjswyAI/LbqfhEZA27hG/los=
X-Gm-Gg: ASbGnct9SZQhnqnsRuB2gzIqZyawPX3b0dCHQNZmVFbqREbFYA6xJf9yO5+/rvgQdKy
 sQnQtkWYbOBIS2/PGjMJhMhug3n8Qqu4RkumzWGxDPSLa4fiwWVAvmrXavtWklXr/r/Wng0dlcw
 ofR5/uwOMs0wYOkJmbMXEb+nuReRyTFIpWCcvRPxbXsgmpiz+K/7ZV77QJ/1i6OKvetrjSibUoY
 fVCqvAZCJlbTlBRhPrqMylPQZnlRkmms7+66D7d8gjJBUv2YuBqIGOKsUMW6C7PCNKJMxJwodLS
 9BLOp9LsbzJJVRa4M6+NI0KSGlqmM4x+/+FcE5h+96+uu9Hy
X-Google-Smtp-Source: AGHT+IGaVwRAlXksUBzIk0Uq2tvI+7fx3TLZlTGz5dWWXGV+yRwnuSWsBjlGfnOWXaUlWhJkurLG8w==
X-Received: by 2002:a05:6214:f0c:b0:6e4:501d:4129 with SMTP id
 6a1803df08f44-6f8b09398f4mr124884716d6.11.1747868553932; 
 Wed, 21 May 2025 16:02:33 -0700 (PDT)
Received: from t14 ([2607:fb91:1be5:f4d8:99e5:a661:f426:884c])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b47e38fcsm85993426d6.56.2025.05.21.16.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 16:02:33 -0700 (PDT)
Date: Wed, 21 May 2025 16:02:19 -0700
From: Jordan Rife <jordan@jrife.io>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [RESEND PATCH v1 wireguard-tools] ipc: linux: Support
 incremental allowed ips updates
Message-ID: <vq4hbaffjqdgdvzszf5j56mikssy2v2qtqn2s5vxap3q5gi4kz@ydrbhsdfeocr>
References: <20250517192955.594735-1-jordan@jrife.io>
 <aCzirk7xt3K-5_ql@zx2c4.com> <aCzvxmD5eHRTIoAF@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCzvxmD5eHRTIoAF@zx2c4.com>
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

> > Merged here:
> > https://git.zx2c4.com/wireguard-tools/commit/?id=0788f90810efde88cfa07ed96e7eca77c7f2eedd
> > 
> > With a followup here:
> > https://git.zx2c4.com/wireguard-tools/commit/?id=dce8ac6e2fa30f8b07e84859f244f81b3c6b2353
> 
> Also,
> https://git.zx2c4.com/wireguard-go/commit/?id=256bcbd70d5b4eaae2a9f21a9889498c0f89041c

Nice, cool to see this extended to wireguard-go as well. As a follow up,
I was planning to also create a patch for golang.zx2c4.com/wireguard/wgctrl
so the feature can be used from there too.

Jordan
