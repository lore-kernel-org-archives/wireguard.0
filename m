Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EC3CF34AD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 441b04c7;
	Tue, 18 Nov 2025 17:32:05 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 960a150f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 10:54:06 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b8b25296fso12733065e9.2
 for <wireguard@lists.zx2c4.com>; Fri, 05 Sep 2025 03:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757069646; x=1757674446; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ae2pZGeOxUWNnhVB6ytgG1+LzEott/yDmnkqH6AHVYU=;
 b=B7hotrBpWfak7+bLy1ghkYRUD2ACZsGRYnp6IZnooaoC4LIlZnZfxJ7X73Opthw593
 HtAc9H8DqhfNYKB99zDd9RXeRrUvnPY8H45ft4RTj/YUIBHjb0JD1vCXrtXNfdcLxJPV
 VG9t2q32h6wWQDNfDSVE93TXPEocjQ0Ry0O314hFGxWIhbHD0PN0rsaTSpHknk+K2vZ9
 iVuBR7YBU9zLfw8Was9CCyLevA5Kk01WDHli1F687NcP9/+cHNjKjZ0oUwQ3wR8CqqO1
 9eRgKowQqHiMpZmFrC5/IT111R1zspDAHx1nRz5xqTxCvNA7ptgcnwcDfT2TmGsbFaAH
 aVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757069646; x=1757674446;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ae2pZGeOxUWNnhVB6ytgG1+LzEott/yDmnkqH6AHVYU=;
 b=KPb1nO3cdb8kQ1/r9M5jQkdv6JuWhekC8dinkdT6TLFKV1NwtZWAG0HoNWI8ViMzsU
 e+PPfq+IbPlx5jiGxNPm78nPndFVMrXw7YphRtvnIJ/y0+Q9SQcn8gokiGmCpMV7BW+7
 owvbAgXAm4yhqm+0xBnhR+FETp2ftDcGgD21/36hu3bbq9FRvHXd0nbOg8VyOq/KBcWW
 Y1ueYMiDH6S5uTlfH/+6E8lyBsQPfxV3tGFDO8bU7wGMF8EaExQRijRRxgPCcfOQRhl2
 Pt5YDLQR5hVyeq5Ico8oeHcdyD3/yOupEJrK7/6PczCO7ZnYJRhbyf9iskO1WRpg5CU7
 ESCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU13pmlThpyvp5qi6z60tlGQ0zlhmih4zmYMLDhmAIbdQPAQt0Rv3/qhIK91nD8AU9tP+IZXr22fXA=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwED5lMYMMzGocakvAfSbsa4yDfnvNXCqcCmBwVJHeIKc3cFy30
 gaNpa7R8ayEguYiXl+GkK9btS4HO5MucHpffMVZhvjyYnMzPVSwkdUd/
X-Gm-Gg: ASbGncsWfJ34pZlXeciYhWgLg83rjulIrvCULcNuP/fjAmoQnGLe/lB2XqsllwewW7N
 Z0QJQ3F1Ejh8VGt2btK4Nk3kLDGseLZbpOO20+7vVvzA8oy2QX9Z7X5KhpMLZQvIAEcx8hCOqRm
 c00oqPwJywnoGiDfQgBwHH50amrFixdS21znqYMoHuwgLJdfre0fqr8LNnjNVOeJlBO5KGwtcUw
 tnni6QCtY38As9K2w0kqFTylF629rcxglZKJMsUic3wkY7LnYyPctAcnUa6KndnsGraDP0IlSVi
 d718GhYfhIi9pg63DqBZ2ZSwd7YatEIQ3usrSAJELZ32jYaxHRfckwMb0F71ygy9tllBRRFyF4k
 agVMr6tQi+bsOejK30doEN9ivl4FtbD1T//w=
X-Google-Smtp-Source: AGHT+IErKZNogTKW8vD9MH4j6VFAS9sssyaSu6xJlnSctBMhQvR4qqCnPzMGjDlbH+jJnp/0mbVdaw==
X-Received: by 2002:a05:600c:c0c3:20b0:45b:7699:f96c with SMTP id
 5b1f17b1804b1-45b855fba81mr126256125e9.21.1757069646200; 
 Fri, 05 Sep 2025 03:54:06 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8157:959d:adbf:6d52])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf276d5e5fsm31345266f8f.27.2025.09.05.03.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:54:05 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 09/11] tools: ynl: encode indexed-array
In-Reply-To: <20250904220156.1006541-9-ast@fiberby.net>
Date: Fri, 05 Sep 2025 11:49:09 +0100
Message-ID: <m2ldmtxjh6.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-9-ast@fiberby.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net> writes:

> This patch adds support for encoding indexed-array
> attributes with sub-type nest in pyynl.
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>
> ---
>  tools/net/ynl/pyynl/lib/ynl.py | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl=
.py
> index 4928b41c636a..a37294a751da 100644
> --- a/tools/net/ynl/pyynl/lib/ynl.py
> +++ b/tools/net/ynl/pyynl/lib/ynl.py
> @@ -564,6 +564,11 @@ class YnlFamily(SpecFamily):
>              nl_type |=3D Netlink.NLA_F_NESTED
>              sub_space =3D attr['nested-attributes']
>              attr_payload =3D self._add_nest_attrs(value, sub_space, sear=
ch_attrs)
> +        elif attr['type'] =3D=3D 'indexed-array' and attr['sub-type'] =
=3D=3D 'nest':
> +            nl_type |=3D Netlink.NLA_F_NESTED
> +            sub_space =3D attr['nested-attributes']
> +            attr_payload =3D self._encode_indexed_array(value, sub_space,
> +                                                      search_attrs)
>          elif attr["type"] =3D=3D 'flag':
>              if not value:
>                  # If value is absent or false then skip attribute creati=
on.
> @@ -617,6 +622,9 @@ class YnlFamily(SpecFamily):
>          else:
>              raise Exception(f'Unknown type at {space} {name} {value} {at=
tr["type"]}')
>=20=20
> +        return self._add_attr_raw(nl_type, attr_payload)
> +
> +    def _add_attr_raw(self, nl_type, attr_payload):
>          pad =3D b'\x00' * ((4 - len(attr_payload) % 4) % 4)
>          return struct.pack('HH', len(attr_payload) + 4, nl_type) + attr_=
payload + pad
>=20=20
> @@ -628,6 +636,15 @@ class YnlFamily(SpecFamily):
>                                             sub_attrs)
>          return attr_payload
>=20=20
> +    def _encode_indexed_array(self, vals, sub_space, search_attrs):
> +        attr_payload =3D b''
> +        nested_flag =3D Netlink.NLA_F_NESTED

This line is not doing anything, right?

> +        for i, val in enumerate(vals):
> +            idx =3D i | Netlink.NLA_F_NESTED
> +            val_payload =3D self._add_nest_attrs(val, sub_space, search_=
attrs)
> +            attr_payload +=3D self._add_attr_raw(idx, val_payload)
> +        return attr_payload
> +
>      def _get_enum_or_unknown(self, enum, raw):
>          try:
>              name =3D enum.entries_by_val[raw].name
