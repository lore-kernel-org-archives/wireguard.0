Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B59C54ED1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:59:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5edb83ef;
	Tue, 20 May 2025 19:42:39 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e8a95d0f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Mar 2025 10:25:07 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-225e3002dffso55760695ad.1
 for <wireguard@lists.zx2c4.com>; Tue, 18 Mar 2025 03:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742293505; x=1742898305; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vHJpZP+ouwvFF8IfLMmV8qW0ir9r9wU3clAjxfEY604=;
 b=QKIOUrAnA2sTQJlFzuGmcWGZHhbpCyLpHHFpsARhfoJ7GycKtVYeUvXv5VI+F9cwh5
 GKwKQRruGK4dw3EnwS8WleJcUR7G5Ck5DT/U+olf3k2OVd0q2MOD9JthWQVA8UczecSl
 XvHQYZVdEIeuVEO2hF/txyxxvdG5eD+K3uESa7AecCDhVYs4IH4Alct9MpCTMt9Gg3Xa
 32cQjxgKrnQ6o46FFB1XXHQMgbhccs7vq4EYb+T6WKYexx6kmKwHD4knYtlsuWnS0L7j
 PbyZaYakTkJLHJrpRcnptsb3a225EUOzOcqPA0hA7J6imrBhSS+DKgzkbyf2PsibGDBs
 WLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742293505; x=1742898305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vHJpZP+ouwvFF8IfLMmV8qW0ir9r9wU3clAjxfEY604=;
 b=YZcyweFTNfa3tLc11ql3Vb1a0HHeRLBWhqyirZXjM8s7xdboNf7MqIAGTouMluoKMn
 J6cRXKMo4c6J+XlCNfAcQDc4X0SQolJhqAEHghuFH57Jas4vWx08QVR1CwxSna+g4qkG
 QGl2GeX/EaduNnLDwc8/11iYTlplPHzOoDPPYDvQ+tCoMua286U/hZ67XLkjlR7BhYDV
 FGMN/fdWFOVCdkvgaWJLgvLiMdn1Ut8K6V0zhAR8VT6yNZmNgdTElIZB+OTfuW9xMHX4
 VBd2g0dCYWDSSJdX6I5ARUClx8dBuCEgLidJNjwvP6rIBgTPSNppBrN8CwbCfu6Xax+b
 tWOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqL3A9O9Sk+YzmFGm7DcGCQd0a7c2/gDaiDPyADe3eH78s8Q4wF8xX5vHnWtszKqNyxszHDaw0g9k=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwuoNh7h2NdtN5E2+cLI1qN6FZEbA73ZUcKIuqIUCFOa1TMGmh3
 8vqjKRoWrdGfwa3Sz2EsxJoH2tAzBiyV4ldNox9fAPN1sfnWDl3p
X-Gm-Gg: ASbGncvu1n7u0mzpwrpleaaB+dT55yaxQkf9qnz94G6GovUPIECD0y0PPgZQPUdZI3b
 Lf5Z+J8pswxDPKkWnUhjXxCHCD1s6uaKSQJBtsTL3CBuCeihWB5Dur1PkXB07gWACzMg6FAfi6X
 rbAu7/WqgkBW/UOt33JrugJqFhKdf6NbP37iiAJlNRD9wLG+aml4H4g31VoOb1IZNx8MtLLc2SK
 g+JZgfYX51tKfnRJKkMmyWjB2buPkDKDjDw0XGk06BkKOvf/NAv8UKWmEXWtT/Zr8OkwxSa+vNb
 FMLnkrHPO2RYBr/nNaJ7agA0SFasOd1z2aEKQopcXCASI+QTgA==
X-Google-Smtp-Source: AGHT+IE6gdO1UuE0ixmpB6cazW3Pjzhx+tIz6PbNhLSt1J2XBNAgq1vv++MsWYhJd831LrG0jM1yLg==
X-Received: by 2002:a17:902:d2ce:b0:210:fce4:11ec with SMTP id
 d9443c01a7336-2262c51bc7dmr45795425ad.1.1742293505083; 
 Tue, 18 Mar 2025 03:25:05 -0700 (PDT)
Received: from fedora ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6ba6a38sm90449665ad.108.2025.03.18.03.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 03:25:03 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:24:40 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 RESEND net-next 0/2] selftests: wireguards: use
 nftables for testing
Message-ID: <Z9lJ6PXHeL7tfhUf@fedora>
References: <20250106081043.2073169-1-liuhangbin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106081043.2073169-1-liuhangbin@gmail.com>
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

Hi Jason,

I saw the patch status[1] is still "Awaiting Upstream".
Is there anything I need to do?

https://patchwork.kernel.org/project/netdevbpf/patch/20250106081043.2073169-2-liuhangbin@gmail.com/

Thanks
Hangbin
On Mon, Jan 06, 2025 at 08:10:41AM +0000, Hangbin Liu wrote:
> This patch set convert iptables to nftables for wireguard testing, as
> iptables is deparated and nftables is the default framework of most releases.
> 
> v3: drop iptables directly (Jason A. Donenfeld)
>     Also convert to using nft for qemu testing (Jason A. Donenfeld)
> v2: use one nft table for testing (Phil Sutter)
> 
> Hangbin Liu (2):
>   selftests: wireguards: convert iptables to nft
>   selftests: wireguard: update to using nft for qemu test
> 
>  tools/testing/selftests/wireguard/netns.sh    | 29 +++++++++-----
>  .../testing/selftests/wireguard/qemu/Makefile | 40 ++++++++++++++-----
>  .../selftests/wireguard/qemu/kernel.config    |  7 ++--
>  3 files changed, 53 insertions(+), 23 deletions(-)
> 
> -- 
> 2.46.0
> 
