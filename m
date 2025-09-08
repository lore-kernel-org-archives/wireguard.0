Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8BFCF34AB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 13:02:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe9ab888;
	Tue, 18 Nov 2025 17:32:10 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ab59d0bf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 10:35:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45de221da9cso6391205e9.0
 for <wireguard@lists.zx2c4.com>; Mon, 08 Sep 2025 03:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757327703; x=1757932503; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5iDY+Vi0EdOqRjdG+5WCOpNIgHMMJTkV6QF3KBvr3ao=;
 b=m6Jg4OczbOEzMm5nKK104aE/JxE52kvNWtY1JD4gebdsZMtE6KlKI3qzXi20ps6kgs
 C/baFDB6SWrA3q8prTIoWbTL6CTsvjLLODRChCPVyBgnxT16EzjeUvbOu6Eu16hMlvCf
 J3c2Scsb0C8kfTH6ecUZY36hgWFXw9logUIBGqklS9CzZg/pTNZb6BMYkTH8GzbUfs/2
 9sOjE0Y7mwrWRl54OkseX5WN8G1/mPoDhQS+wMw+vKNlJy2J5v/htoibqEivH622dYj3
 c0747u3ge1AVLJrylY2gyKkFTb/GPBje6DdRHM4ajOj8DguDj5QJxiaXlsz9awGUox8Q
 fgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757327703; x=1757932503;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5iDY+Vi0EdOqRjdG+5WCOpNIgHMMJTkV6QF3KBvr3ao=;
 b=cO+LRt8zQvQG8FUrcB7W9kNvm0taPEQhTtKRU2yqzm+JqPSHbFpB50025f1ZRmqFiR
 UkaUsoYjQo+FllJmq4sg0ApfcxBrX6E8XdZy6Thv+GMnIXCvfNYqqHuY25DM06Jni3Ul
 dqYEZEBg+p6NevyGyxVXu1HdrFkzfnij+brljBsorIvFh+Mp5+rkX+7Jj1s2VeQepRiS
 N8OKi0IeCPqmeg/zX4EbzrSVNoeCvOr6SrvA3tkDSmJBr34pQywbSiHN5jYjZpBHK0ss
 FF0TMYqxj+wOg4G1P0KyFgNcuRowZcz2pJTFevRV4zllva6MgaUgSDIpQKqWjn1FbF9l
 Eggw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1CP8isYmTo9sh/kBNXTRUmurqTwkQUFHFU74c6uzOQmS/FPInLU3Mk2JVGzWQuDeXLLt8jPOPvuI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyUA2KeXjMSi8M0mhyDor3csQnv4cV1n2tJX2a54fWjhHglqFHe
 KExbArVPLBy11i3LKY7jNjKwIItgTJBjKOeZL+n06OnOMc3JfTNctlPv
X-Gm-Gg: ASbGnct8ENqPPHmkUpKR2Se2S3I5buolbJlkZgGvtR6PueD7gFkkXTwYCrV1V9U60OJ
 KQcwjcsmnRdB1xzjf6eY2n81HMlJraSBKvQA5IdnKxsH7ixxiDrwtIO0XcuUws3FVkeZo6VvlIe
 mDYg0rl1C9jvhq8FmXoRHEpdnDSaboO8p294UN0imUiFTvYCj3MK7SKHl5rpM5Z2Agoh1ehlIhQ
 ChJlPUR5XERkXQOLiGuEVB3fr8SqM6GZU8JYzUWLcZ60jfGYOSL9nbBwR0S2JqOkSIu2g1NtPb1
 Hqw1MP3j+ISv8XU/Mfxme+TQ3rPV9XV7fL+j4aMYcINYBqRbCUD/9dJvahG/lEgp2XHQ2PtHajr
 k9kyTPc/owmZrflT52QcF4laFIagTMIU5AwpcoPgw5VOEiQ==
X-Google-Smtp-Source: AGHT+IFA1bYE54JJaTFNePXQZmaaRtj5UDlgcqlwzpgBxMXl9p8+4+og96mcgEoXG8/un61iG2AtxQ==
X-Received: by 2002:a05:600c:1f16:b0:45d:d5c6:482 with SMTP id
 5b1f17b1804b1-45dddec845bmr63293325e9.18.1757327703349; 
 Mon, 08 Sep 2025 03:35:03 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:4171:ec50:b666:2385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45cb5693921sm242509545e9.0.2025.09.08.03.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:35:02 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: Jacob Keller <jacob.e.keller@intel.com>,  "Jason A. Donenfeld"
 <Jason@zx2c4.com>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Andrew Lunn
 <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/11] tools: ynl: decode hex input
In-Reply-To: <bf530a9a-dca8-4df7-b9f2-9f2b3a1d2ce1@fiberby.net>
Date: Mon, 08 Sep 2025 09:28:26 +0100
Message-ID: <m21pohwdp1.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-10-ast@fiberby.net> <m2h5xhxjd5.fsf@gmail.com>
 <410d69e5-d1f8-40e0-84b1-b5d56e0d9366@intel.com>
 <bf530a9a-dca8-4df7-b9f2-9f2b3a1d2ce1@fiberby.net>
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

> On 9/6/25 12:27 AM, Jacob Keller wrote:
>> On 9/5/2025 3:51 AM, Donald Hunter wrote:
>>> Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net> writes:
>>>
>>>> This patch add support for decoding hex input, so
>>>> that binary attributes can be read through --json.
>>>>
>>>> Example (using future wireguard.yaml):
>>>>   $ sudo ./tools/net/ynl/pyynl/cli.py --family wireguard \
>>>>     --do set-device --json '{"ifindex":3,
>>>>       "private-key":"2a ae 6c 35 c9 4f cf <... to 32 bytes>"}'
>>>>
>>>> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>
>>>
>>> Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
>>>
>>> FWIW, the hex can include spaces or not when using bytes.fromhex(). When
>>> formatting hex for output, I chose to include spaces, but I don't really
>>> know if that was a good choice or not.
>> I also prefer the spaces for readability.
> I formatted it with spaces for clarity, even without spaces it was a bit
> long for one line. Spaces also has the advantage that you don't have to
> think about endianness.
>
> Should we define the display hints a bit more in a .rst, or is it OK that
> they end up being implementation specific for each language library? Do we
> want them to behave the same in a Rust YNL library, as they do in Python?

Yes we should probably extend the existing doc to at least describe some
of the defacto behaviour.

https://docs.kernel.org/userspace-api/netlink/specs.html#display-hint

> BTW: The rest of the key used in the example can be found with this key-g=
en:
> $ printf "hello world" | sha1sum
> [redacted key material]
