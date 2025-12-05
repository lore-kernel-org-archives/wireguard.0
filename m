Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AA9D2F7DA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Dec 2025 10:58:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08cbf46f;
	Fri, 5 Dec 2025 10:56:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1158a8b2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Dec 2025 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764932153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7gSf2n5M3odk+ChxoT6AFUK+lODC5oQOZkjvhzNfhw=;
 b=NQHC3P/2OB18nWjkxyx7xwZc5zuWwqP15gzLzBp1WWSlo+KwFIA5cR/NEP06YUinF7GKtf
 JXHGNfgqsAIScBQeLG2agZVCkOoGtexzqgHqlW60J66Eic9UlWS8B0gcUeQLyhv4jYoiJe
 GglW/wZeXdBHRsNty78XAz+kHqwV/z0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-WeW95tRmOtWC-hiu43AgDw-1; Fri, 05 Dec 2025 05:55:52 -0500
X-MC-Unique: WeW95tRmOtWC-hiu43AgDw-1
X-Mimecast-MFC-AGG-ID: WeW95tRmOtWC-hiu43AgDw_1764932151
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b763b24f223so185333566b.0
 for <wireguard@lists.zx2c4.com>; Fri, 05 Dec 2025 02:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764932151; x=1765536951;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h7gSf2n5M3odk+ChxoT6AFUK+lODC5oQOZkjvhzNfhw=;
 b=pIaruOS7Y+oZuaXp4u5dsW8uTFvmmRDi7p19qn8Cnx7m25EEzIbK4OovmcnTJc1W3G
 AqU5JeQy3uO5WFzulYi5/WXamYpu4YcluBdEQ3t9vW2wv1ynIq1YFj2eKOANIFcvM1Z3
 7zsrWknRCgeYxo2aZQVWex5Db1sjft9Jkh2rPkhx5DAVk4jrogjEjL4OTpvMnGwn5raF
 wjQMi6cOgFMGBLdIf6ReCh6xRFJ63I2hdjnxRoViAEoCkL1aZDNbz2WzgPSDLjT0d4Ct
 hqmechLFR1wZrNpa9GLtr7SswjGSRZ8EtwB4/jYXXQV6BGOxvp/5Hx7EYD3ALvmSY8jm
 6pFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfiM+tuuBlKJik9IVWFDQ/Z2VIcWSCPXQNNOqO5GeSCd+IunQrF9NdGoYL4EyH2Ogp5wWZjAMqmEg=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwYTdn4651OP0AHyyIyoKyYmEmyGSWRAkKAwJxBztKimdEwTBsW
 ok/v4L4iKMMQcATk/pYAae+gC8oC/P+0QpLZi0rdDcX7/eBSEGcvBbtT28tuE1Zrqub6HaWCMj+
 loklI+ivQaonT5G7yxu/lZ1Jxfj+JfNjIrd6TWDqh5orcWf0nGB1r6eSgYMIclg==
X-Gm-Gg: ASbGncvNU+6UuijxLay0PVDHh/6pwCcvkJqOJCYZr/BvBUnzDwMNAJelTol78mlbQGu
 tXZHuENh+tH3PX3iO10Ges2MPB64EMb23M9BZRECfdDv9X3LYQaEleHe2cCTq4BL+Ah7ImCsUFc
 5749ZxFTc0NwowZYuc0PepRE20S8O1naVy8NVlMb4ulELFhbTrIkmzLsc+WBhe4VxtLHX6kiUW1
 aJPJ+lcm4gqtSlCI+QLSx38a/IJY5FLOL6noDnR+QtOtNSje4VKo+sxRzFgxKZ0HovwNcYsqpnm
 own+eYTe/mg13ChLPtD1M0BbhLCLeNGhlTn3SboULEXu060BGiHSU3Wpi9GiXh4oM4i2b/foyFb
 e7c0KzEVFx+uh+Q==
X-Received: by 2002:a17:906:7953:b0:b73:4fbb:37a2 with SMTP id
 a640c23a62f3a-b79dbe8c6bcmr946951466b.5.1764932150944; 
 Fri, 05 Dec 2025 02:55:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0fCpVjMBXkMIqMsOLr+JuNuOZ4LtvJSBlHhcUoih/A51LWRZLURxoWIUd3WMgn58OFYGAPA==
X-Received: by 2002:a17:906:7953:b0:b73:4fbb:37a2 with SMTP id
 a640c23a62f3a-b79dbe8c6bcmr946946066b.5.1764932150435; 
 Fri, 05 Dec 2025 02:55:50 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.199])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f49a897fsm344670966b.51.2025.12.05.02.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 02:55:49 -0800 (PST)
Message-ID: <15b104e5-7e8d-4a7c-a500-5632a4f3f9a8@redhat.com>
Date: Fri, 5 Dec 2025 11:55:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [ANN] End of year break up to January 2
From: Paolo Abeni <pabeni@redhat.com>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org,
 "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org,
 Dust Li <dust.li@linux.alibaba.com>, Sidraya Jayagond
 <sidraya@linux.ibm.com>, Wenjia Zhang <wenjia@linux.ibm.com>,
 "D. Wythe" <alibuda@linux.alibaba.com>, Matthieu Baerts
 <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>,
 MPTCP Linux <mptcp@lists.linux.dev>,
 "open list:BPF [NETWORKING] (tcx & tc BPF, sock_addr)"
 <bpf@vger.kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Tariq Toukan <tariqt@nvidia.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Aaron Conole <aconole@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 dev@openvswitch.org, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, devel@lists.linux-ipsec.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>
References: <3a2cf402-cba2-49d1-a87e-a4d3f35107d0@redhat.com>
In-Reply-To: <3a2cf402-cba2-49d1-a87e-a4d3f35107d0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mXzqfuIHGnpqwzISJxCjH89whALCBUDsiSvfLzLAsEA_1764932151
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

The EOY break poll concluded with a substantial agreement WRT the break;
the final figures are:

			Voters	Percentage
it's great		28	41%
it's fine		23	33%
I don't care		11	16%
mildly inconvenient	5	7%
unacceptable		2	3%

Given the above, and that the capacity in this period will be severely
negatively impacted - most of the maintainers will be traveling to LPC
the next week(s) - net-next will stay closed for new features until
January 2.

Fixes (for both trees) and RFCs will be processed as usual.

Thanks,

Paolo

