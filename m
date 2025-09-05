Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D9DCF34AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 12:56:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c36750e1;
	Tue, 18 Nov 2025 17:32:06 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80560511
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Sep 2025 10:54:08 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45dcfecdc0fso15860015e9.1
 for <wireguard@lists.zx2c4.com>; Fri, 05 Sep 2025 03:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757069648; x=1757674448; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QF5aHDOe/RINI2mjAwVr/DvcIRAlm1Z12kISJhmvEiM=;
 b=XvEGYVQbBQ5i137eyjEIyuZHl+QoqRA5U54quF6Ba3iy1h3+ltqQyzh6v1jeNnGUWs
 ATzwKKOZOv4B1dQnkGOZEycAIyKk0P4qSiPwilBo+QCug/drvjYyDR+0Nppr7PU8zfG9
 g69Lnj+Y4musUC41zu020bg5ie1668rv7lftfE41H2Oh7L3KChQyh9SCXTAfP/+4evek
 pXyz4tTtojrpFe0a7PT6OVxlhwVx8st3VM2kuM64BTj17j4V9bbv2sLKVMilzGhwH2rF
 9crfXsPcyK5z5Yo/mGFP43lZyDjpYUV2yZXi4XlcH67F2PNUow6kaORYU+uF6XHl6lql
 6zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757069648; x=1757674448;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QF5aHDOe/RINI2mjAwVr/DvcIRAlm1Z12kISJhmvEiM=;
 b=qDWFMyVuq4Wn5qswHafssd1ETiwAQUgqmKqNHDTILg4uYKXB2vOgu/VinXkyh4Y3X5
 LC7UY4YWbgc+PiNoO3HWYa5wUUJWqxc9ABw2TRPdFmYn6UT6AfkkNvyr3nj1qz2uTp5E
 dCtRc0S553xhZUCzuUMam+gV/yGvQqGy0TxNJYOKJhqX2XmlbEoNZd4xEuSwDfCwEHFE
 wNCJPpuxF3a4rFdmVtrbaGHcPEJ3UHwiPFSfJ6PffeVynau5FJp97yuxbP7XHhOZsOKI
 B8Ouw0prfUNgH37JGWyxWCO9TgEQrNrp7rCo1ZAvNYRkdbpHshojQsBhcSUTcUX9xyIp
 44Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0S1YWcgrslc7bp3KIu2wBhluA3jsvSS7fGxoO0CqMdhgzSXvEbGuTGPFSG6qBe5QZgSduMHXQC0E=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwzvFXlQMNq56gJ4vI/AczIFLhTHDDYXE0DFZmDKAQQmwnKMwN3
 s3WHq9UGiCg+3YZsLsV0pBOogYWZ/Tkydn6x4Zc1/9w1QdDAaOUW+CXQ
X-Gm-Gg: ASbGncsxedgg+JQ+l6J/flPCP6oXOiuGPEve4PI1mhJYbyq4rCCN47TPx2kcJZIsNNG
 xRjM/XTRbqx8j8P7+Il+9XRpBmXDk4QwAPeHA+ssZQulpq/135K9ShjihglAb5X7vfxsJVH6AwU
 rTg8t3Pzs50rmlPXIzVAu0PzGRDA4eh2T+6XA+hv49Q3K5obLtyQYf6I7lXtIi5t5BKGoSa8frf
 1Y9iP/MS6cOvUQBUhsKJRcrYTyM4fGu3iMCwmDzuqYso1E3bfCB7kU+DCqJfAJM3sUvewomQK1c
 WhQ5BC36ItgM/jt/Tkw+sC04+6PHr6RtGRGgKU2YOlR0gCOWNbtEV3UskTBfKWoF995HWHZMNek
 DrG5AVxkbQpI1BLqCYKftjDxR6gdVGI96/Im/QePPZXlmxg==
X-Google-Smtp-Source: AGHT+IE4h9xaKFFB+jg6jXUNHyf7TN+VxDEKHWg97267A3zCXVPEAozhpOfzu1jpwOA1O/9P9hllMg==
X-Received: by 2002:a05:600c:8b2a:b0:45b:8600:2be1 with SMTP id
 5b1f17b1804b1-45b86002e27mr192622385e9.7.1757069647630; 
 Fri, 05 Sep 2025 03:54:07 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:8157:959d:adbf:6d52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dda6da5casm17288345e9.7.2025.09.05.03.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 03:54:07 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/11] tools: ynl: decode hex input
In-Reply-To: <20250904220156.1006541-10-ast@fiberby.net>
Date: Fri, 05 Sep 2025 11:51:34 +0100
Message-ID: <m2h5xhxjd5.fsf@gmail.com>
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-10-ast@fiberby.net>
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

> This patch add support for decoding hex input, so
> that binary attributes can be read through --json.
>
> Example (using future wireguard.yaml):
>  $ sudo ./tools/net/ynl/pyynl/cli.py --family wireguard \
>    --do set-device --json '{"ifindex":3,
>      "private-key":"2a ae 6c 35 c9 4f cf <... to 32 bytes>"}'
>
> Signed-off-by: Asbj=C3=B8rn Sloth T=C3=B8nnesen <ast@fiberby.net>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>

FWIW, the hex can include spaces or not when using bytes.fromhex(). When
formatting hex for output, I chose to include spaces, but I don't really
know if that was a good choice or not.
