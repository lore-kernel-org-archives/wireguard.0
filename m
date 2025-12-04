Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2728D1D899
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Dec 2025 08:37:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81193830;
	Thu, 4 Dec 2025 08:37:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 19df8b9c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Dec 2025 08:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764837459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fgti3Yp68+r1SXdHjNvigqNpTieQfP3rIFRvqwDgXVI=;
 b=ZpQFNzAeVEUSBeymrYARs3asayHbvEII9+G4r1uEZnc5FW5fYhOlaaaD2RvhNLax/Ehy5N
 SvtePppkfmYVgR6tlFfKd5RY+oXhriCS1xsXBqU3Mkk/QI8AHj+CkdBc0+XS+HBg2P8Z3s
 Zhrpe81G2pg6o4BjZekHMXC/0jkzWtI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-rbMv8mKlP1emEkakQcNM3g-1; Thu, 04 Dec 2025 03:37:37 -0500
X-MC-Unique: rbMv8mKlP1emEkakQcNM3g-1
X-Mimecast-MFC-AGG-ID: rbMv8mKlP1emEkakQcNM3g_1764837456
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477939321e6so4206345e9.0
 for <wireguard@lists.zx2c4.com>; Thu, 04 Dec 2025 00:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764837456; x=1765442256;
 h=content-transfer-encoding:cc:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fgti3Yp68+r1SXdHjNvigqNpTieQfP3rIFRvqwDgXVI=;
 b=TEP9ChJ6EqMNeyzUAjT+ajjLoLKfJefW+hY0q98IyD16On2Dk7sdgrvNGeISx+AULp
 POK00cbJrv5NKXJVwYdsyZ4ZJl3RvLCwxqCVmQNKJoNCA9t8O4kT/n6wi/O9trOfw0pt
 xLLZGksZ/UE3OUyGEIewimWzZmzyz5dDlazz7NwOCH0bam4OH8Wm2HKO5t0RVj6Zh12r
 mhZ3Lbx+t/jzpQ5fFnlbSjTe/A7HSx3c+m3vqQobvO4moVWEwaqQH1esN5fswTJeEbF/
 XYLsTG7iALLrbnJ9lwXD7amwKMD2Beu8j58OMaI/0yZxqhXRwYuR5VxeBpk49RF2ek33
 3tWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/kS5yHPeFPaH7/I29Qmo34I2XmU2WdJkezVlQrkOXHFcUZFYYtttC2RcxYdO0P7l5naB5PO1swXE=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzUfhT0aC3380FwETjNhW2CkOkEBpk1J/2n8kETcrHnRVb/AQ1e
 qSKRJM0ubD4AcCizm2EstY9XPisLyLOMNs9F/Zpox7VUfnFT2pIm9RX/hle+6VY6dtj6O4yztXj
 GHOTafnbfBpfukDF5rd+vQ9aXAuB4yY8IT+r9jRcerBGqUukUHIaslgL3+25Uew==
X-Gm-Gg: ASbGncu13YJ8RcJixFHGgEg5FXSHvdWDcePm8ZmygRsxPYGq8+slb2SGYz0ERmYFHdF
 nKwa9lHdesGRMxK6r8DRARZdfez4rCMVIxH5OiGqpFyZifG1uNzpBeBzeTtf3IJrciWsVLxWF1R
 +NxLsagqx8RDFzOIGiRMQuTI7DV0VZby5NITwJQBj2hlMyi2AMQfHWoc16oPaXniRI2jDUnKzLU
 djWp8TOqFbJ+e5flMrnctCrbRyIouayPU1P1QkjnW6zwmcrPwLDUQ9giS8NLo49Gv7xE2uqvp3x
 P64Bscvn4uwB0NP83ACgE2sjo8DTn0emELCVlpcdVyOsp+hYBygIkYRUB4839eK27DUkCtbVgPX
 Qh9l6ty346c7f
X-Received: by 2002:a05:600c:3b1f:b0:477:fcb:226b with SMTP id
 5b1f17b1804b1-4792f24413emr20683865e9.2.1764837456389; 
 Thu, 04 Dec 2025 00:37:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOFiaycmUpSi4NFw0Dx9Owuk3m9GKbQxWbEzhOFEEvLDFewzTh2sfwX63tPD9WFtnBq5V4Cw==
X-Received: by 2002:a05:600c:3b1f:b0:477:fcb:226b with SMTP id
 5b1f17b1804b1-4792f24413emr20683335e9.2.1764837455818; 
 Thu, 04 Dec 2025 00:37:35 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d352a52sm1925339f8f.38.2025.12.04.00.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 00:37:35 -0800 (PST)
Message-ID: <3a2cf402-cba2-49d1-a87e-a4d3f35107d0@redhat.com>
Date: Thu, 4 Dec 2025 09:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
Subject: [ANN] poll on EoY break
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
 Andrii Nakryiko <andrii@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 20Wh_9U1yRuCguOfUwjTXRDOR3zabwRa6zgHnjgX19k_1764837456
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

Hi all,

Due to some unfortunate calendar, conference and personal schedule
circumstances we (the netdev maintainers) are strongly considering an
end-of-year break similar to 2024'one, but for a longer period:
effectively re-opening net-next after Jan 2.

Since this comes out-of-the blue and with a very strict timing, please
express your opinion using the poll below:

http://poll-maker.com/poll5664619x19774f43-166

The poll will be open for the next 24H.

Thanks,

Paolo

