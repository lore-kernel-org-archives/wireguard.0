Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60050CA101F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Sep 2025 00:30:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93595768;
	Sat, 13 Sep 2025 00:27:46 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e0a330c9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Sep 2025 00:27:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3F92A401F1;
 Sat, 13 Sep 2025 00:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CCDC4CEF1;
 Sat, 13 Sep 2025 00:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757723263;
 bh=HrdxcHyCtTTpJcAiGydPfegXvya3mJ/jU4zuZbNMC1c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jl8r/DQaPWLqwN59Ues0LAqaFmw1BsYEWwk6QoB/JaWfdLS0H1jTp347z+nrvefOK
 6A8BuEy/INlx4poANaVVGdXnEcvBvERS/HS0V94TY/ozx+6snBsFFhV3tAp7X1WQp5
 oS8B5X8c26FdRzOzpS7T9I2GxsHmZ7iN+/AjzjYVrYstLLy2eYQlCnU6etIqMzcGNg
 3N8Ie/7RZQ2XgF3eJsvemrnL6Lwd9LTi/CcB7qPOLMLHadZNPViaGUit0tdSbYyO49
 5BD+9o2M2D4sKptHi7c7NCZqYoeJOoR2jQlt9IiOJqKpc8ewoVabq4oFnzL3qw/HRD
 t0Gov+OCRR/+A==
Date: Fri, 12 Sep 2025 17:27:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Sabrina
 Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 08/13] tools: ynl-gen: only validate nested
 array payload
Message-ID: <20250912172742.3a41b81e@kernel.org>
In-Reply-To: <20250911200508.79341-9-ast@fiberby.net>
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-9-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 11 Sep 2025 20:05:01 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> +int ynl_attr_validate_payload(struct ynl_parse_arg *yarg,
> +			      const struct nlattr *attr, unsigned int type)
> +{
> +	return __ynl_attr_validate(yarg, attr, type);
> +}

Why not expose __ynl_attr_validate() to the callers?
I don't think the _payload() suffix is crystal clear, we're still
validating attr, _payload() makes it sound like we're validating
what's inside attr?
