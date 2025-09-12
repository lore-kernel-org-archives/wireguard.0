Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BA8CF6481
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 21:44:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b70a587;
	Tue, 18 Nov 2025 17:33:31 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4d312b13
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Sep 2025 12:08:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3e249a4d605so1975677f8f.3
 for <wireguard@lists.zx2c4.com>; Fri, 12 Sep 2025 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757678935; x=1758283735; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qQoEkT9yk1hood4SLEOpVCocbVX58h+NyrULhtXcu48=;
 b=iSet14ALMImy0KpV6Bx4e0PEiW7tVfAGq3q6K57/pYBfhTjC/uYE7J3huzJmnPYOTf
 3EqfcEzREsp4YKnyiA81yWDkynLg2nKnETSH7GPAdKZzGp53cwx8j8W7i24H+ObToLyL
 O9DxWMvNgWniZNAYcgJP2qv8ylceQ6hJi517HDEzv2X/aWN3WMLeklRfO2GTN+vZ74Gq
 yJ1HMAiY3x0JTHm+sHm9Cp/9RDQ9eGqCk0TUTSWZqNT251fVZ3W47f80zOMNcNxhXJfr
 A39pviLuHhs3Vzvgggbvvu3KhRIJPsTtr960gYHq/uL+3cvfjs98LEhO9mhqY4oGznEN
 25uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678935; x=1758283735;
 h=content-transfer-encoding:mime-version:user-agent:references
 :message-id:date:in-reply-to:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qQoEkT9yk1hood4SLEOpVCocbVX58h+NyrULhtXcu48=;
 b=ejSkFH4fgMKSsKTgqqUsIylJFUlREcz8UVAyv+tSI2fFdoj7CLmBo/dYC0b0c0YMeh
 zNY/d8A4V7NtOZ2DRf6x4WDtRTJZwbdRVM9zgj78TAfe6FRdmzZfzXPdl19vqmeCeWPD
 1OlcTo8QnebmXsZRDZPRSO45UZn/9QzrkI5QfLhhp/YGGCTEG8pYlGp0EonT4qBdiK2l
 RgaeO4MLPrLF4Snb84fmybFZ2JV/KRxD+7DQIY6X7JcQMb2OTLqZ1HAbsh32qAUGNo4a
 ER6YuyL8Z+azF0CoPBt1seiXVcMH5Lz9sEpVbXNt5houp+rL/DUZ07Z7ljoVhAhLqA+t
 il6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLlQYyDx+L/gqglqvstjcW9UPnNNHQTDq2db/LbL/T6fQFamSc6R/j911+Sz4G87e36WhnXH2CiFs=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyT/KFrn8LmxvTFwCFdqoFryXE0EaGQlgHFo14sQvTmIDvKfIRF
 vYtnHhUsuTOuRlM3SLON3LUuG1IJrumft/GGIQ+98nYmY3soiMwu44tlbPeTMQ==
X-Gm-Gg: ASbGncvcEga4NyTfnB3d2Jk0XvH3dNx5NO4Dz0iWPYu5GFrBbHO+HvVw7BHMvjysVs/
 5zzZkjEUHW3sIZZqm2lqLZ+QuO7wjeOfXxTDfuiNFz1ilCKtiOHKG5+2A2U2GF/OZMYyqQwoO3J
 6ureOo+FG5tLq24U5JfEaV17iSsmDfDcuXqSay2soCsigsWezWWNjiuYlEE+QI86V3IkM4Usyj1
 LDcW3iQ8gHS4Py7D+T23vnsPMwg94FnVA4AJKQmsQxz/fuAU53CuunsUW8QsT4cHcPKPefdDrWH
 i8LigpbtG+s/YfurbIYN9sbp7fkjOK605cDXjc/3xQYA7PbV/lV/A2piIzUtP7lS8x95OKb2pns
 1h2pa8gLTlTr6QMn5KpHzSynFNYR3EaBguQ==
X-Google-Smtp-Source: AGHT+IGdPgp1eBnU7mdjQNbxPC0Ubxkk6H/dLId83PNwbuZGjICOtVkA1L5NSIQ5/V92tkMwWrjUnQ==
X-Received: by 2002:a05:6000:402b:b0:3dc:eb5:503b with SMTP id
 ffacd0b85a97d-3e765a1607cmr2924754f8f.56.1757678935109; 
 Fri, 12 Sep 2025 05:08:55 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:18f9:fa9:c12a:ac60])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e7607cd43csm6153099f8f.29.2025.09.12.05.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 05:08:54 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: =?utf-8?Q?Asbj=C3=B8rn?= Sloth =?utf-8?Q?T=C3=B8nnesen?= <ast@fiberby.net>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon
 Horman <horms@kernel.org>,  Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>,  wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 11/13] tools: ynl: encode indexed-arrays
In-Reply-To: <20250911200508.79341-12-ast@fiberby.net>
Date: Fri, 12 Sep 2025 13:01:21 +0100
Message-ID: <m2segrubfy.fsf@gmail.com>
References: <20250911200508.79341-1-ast@fiberby.net>
 <20250911200508.79341-12-ast@fiberby.net>
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

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
