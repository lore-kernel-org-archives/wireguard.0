Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FDECAC582
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Sep 2025 00:20:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c42b260;
	Sat, 13 Sep 2025 00:19:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ef6b4cfb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Sep 2025 00:19:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9BD2A444DE;
 Sat, 13 Sep 2025 00:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D336C4CEF5;
 Sat, 13 Sep 2025 00:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757722795;
 bh=o1QSNiz0UzcqavKMQnmLCDRESQ6DZ5RarZ2P71WApQQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KyBgXnjE7P3nLM/EVnF+DOZqxinRKhuWogvAhX5DeUtn7sT0o7E6jr4uBdSCCztWE
 2xmV3ca+MS2rMFK8zuWMLibQkK+K1NpltJKuXlLdDqsLxNTjkMSzsifAkG6WH5Ul/w
 ChNRvlCQUcUjksYtWdGwiR71S3c9ISkPft1eUMarjh2sRXZiiEuOB0LbgLeQRq1pYn
 kzdG03teeE2YMXZt+U6geIh6z+xC8HdiGcPX93/e2P2x/O3x2ZsxDbbnLMugWTnqVc
 mxINwwZN0wGNYIdRg/e3O57ITLbhbpAe+WTkhtlzYo8UvS+YFXf1AxRZt0ewZlAqCl
 enN32tbTMURUA==
Date: Fri, 12 Sep 2025 17:19:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXNiasO4cm4=?= Sloth =?UTF-8?B?VMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>, Simon Horman
 <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Sabrina
 Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 04/13] tools: ynl-gen: refactor local vars
 for .attr_put() callers
Message-ID: <20250912171954.7c020c60@kernel.org>
In-Reply-To: <20250911200508.79341-5-ast@fiberby.net>
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-5-ast@fiberby.net>
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

On Thu, 11 Sep 2025 20:04:57 +0000 Asbj=C3=B8rn Sloth T=C3=B8nnesen wrote:
> +    def attr_put_local_vars(self):
> +        local_vars =3D []
> +        if self.presence_type() =3D=3D 'count':
> +            local_vars.append('unsigned int i;')
> +        return local_vars
> +
>      def attr_put(self, ri, var):
>          raise Exception(f"Put not implemented for class type {self.type}=
")
> =20
> @@ -840,6 +846,10 @@ class TypeArrayNest(Type):
>                       '}']
>          return get_lines, None, local_vars
> =20
> +    def attr_put_local_vars(self):
> +        local_vars =3D ['struct nlattr *array;']
> +        return local_vars + super().attr_put_local_vars()

Doesn't feel right. The Type method is a helper which is compatible
with the specific types by checking presence, then you override it,
and on top of that combine the output with super(). I don't like.
