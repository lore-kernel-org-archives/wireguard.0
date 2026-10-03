Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21486CA5FFF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 09:24:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 86970299;
	Mon, 5 Oct 2026 06:56:43 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7cd3cb95
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 3 Oct 2026 20:41:29 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1682bff3cso3460645e9.1
 for <wireguard@lists.zx2c4.com>; Sat, 03 Oct 2026 13:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791060089; x=1791664889; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=E6OYkIaqPnUxrvuUCIn54MgF/0vP3bL77kQ5vHowhhU=;
 b=nSEiC/oZnwvTx2cws9CahkrBVOBNMe/PHpr9aNiWOIk919HOQtyG/9YS3mTrMyRGEY
 os9b+OVR+jFic2J5IWlZ+gJmosKEb/LNa2/W3jkbnnatcdiJd7VxZTwtAcghneoL9Sq/
 PPxDX9yDRsb7n6JM5Dpguoq63VfN7n+KgvyUIyDdHRr5fx3fzsgxa1mc4GOyJ7I1aKx9
 NQdSPLsZBgbIz89xvObK5qm2jT+MSKFclxErndnkrdANLLN1Zw8I0xhfxhxVdSELkUM8
 03gnrqUklqPPc2yb6xvEx7cBmIfiSPV26mM4EgrBsxNfIf/r5A7Y7aqy8UfYLh3w6/3h
 RagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791060089; x=1791664889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=E6OYkIaqPnUxrvuUCIn54MgF/0vP3bL77kQ5vHowhhU=;
 b=x23nkIFDccFEAAcaFFs4KhvONS5m5dNnlVn9wmVshnTPiDJ0bGyApMNiAJo6swJv5L
 WkVOhZ9PRPSfJa/Fynp2Mn/RqdBme2VKiykwijQpp3FHHXTTO82uKiEcHB1K3HJ6XzyP
 dPreGp0S13HdiZXl2GJwlvh6ALw17ipFs4gIF0TK93qHqy9Pfe70RRm3IB0FRqXcBuwB
 5Sj1KqTtt44W8k5sgFI+4al5DPmzSBQ6VlNiewsDUDO7D7OilBtTAD+dnANTqwVcj3Qj
 6dq8Pr1e8FEIWIP3PnwwCq291SQwC3lSp0Ssc+sNbS91Au6EA8kZusFit2LnFGmJXDAH
 WSIA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxePu47SNVPu/lgKAbtzYMuYQF7Jd2zubYe/Q0Y5OHEklsAunhqNUl0KZgECcjFDKz7Pdix02lRT4o=@lists.zx2c4.com
X-Gm-Message-State: AFuF++l93znloAeUmbqlNqB82w8HFWqkU9n4WWXx6PWLoUDpNqqeonOB
 pFnm/Pn8/t/myZmN+AatLg0XPjn2B4X/fdz13ns3RYxVPryrzBOWeNnE
X-Gm-Gg: AYBFou0BsB7pKZzwdY96ahbKM1XZa9K9J9rtnuKWNX9Y4DLJ/+v+BQ3JCAFxvlj8+T1
 L8FcEYnK1KeIMV/Mf6OHRU6cVBA847FgkSi64H0B15CvEHvqFPPVE7h5ItaWlh5wu8FTUSFfLrV
 dQQkz7rubmjXKlRPQCbj+mlUnKr/xu1R037N0l4YS773gdcs5kOhNR/Awe0eMsEwUPbFpQ4D3Tc
 maMjjJq9/qtPHDGgSTnuDnOjPPwytpFgRTXTVWXCqew7LYQlVkZ0t5X417CcvZ0SoJ95K1EuxVW
 oOH+7GlulcUz0lRVzy7D7DKCWp/3BegmCgiGBKsf4G1HknY9eayFK+jU5Inetr3bU4kuT3vrknA
 9oAX4LtF0JjT8fwz/dpdUJOTTGZrzRkdm/LhSvrxJd8kLfMeDz4G0sQsf2jHaxZelPAVf5DEH4X
 TJoQyj2WS0PMeW2Tjt2GXr5pnv3qkBkuY5+oZH3EDWkVL2EJvzuRjd+/UCfxX7LemghFpMaHuiG
 oQ=
X-Received: by 2002:a05:600c:6212:b0:49d:15b9:2a2a with SMTP id
 5b1f17b1804b1-4a1680e9466mr44010265e9.10.1791060088970; 
 Sat, 03 Oct 2026 13:41:28 -0700 (PDT)
Received: from Mac ([188.163.8.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027741586sm197124835e9.14.2026.10.03.13.41.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 03 Oct 2026 13:41:28 -0700 (PDT)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 netdev-bot+sinfo@kernel.org
Subject: Re: [PATCH net] wireguard: peer: free packets left on the per-peer
 queues on removal
Date: Sat,  3 Oct 2026 23:41:27 +0300
Message-ID: <20261003204127.15139-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179105878022.1402591.10615903497956533993@kernel.org>
References: <20261003201625.4572-1-apasichnik9@gmail.com>
 <179105878022.1402591.10615903497956533993@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

On Sat, 3 Oct 2026 20:19:40 +0000 netdev-bot wrote:
> - How the issue was discovered, e.g. hit in production, hit during
> development, syzbot report, manual code inspection, LLM or static
> analysis tool scan.

It was found by an LLM-assisted review of the peer removal path, while
I was working on a WireGuard change for single-CPU systems; it was not
hit in production. I then checked the mechanism by hand against
__napi_poll() and the WireGuard history, and confirmed it with a stress
test in the WireGuard selftest VM: remove a peer while a UDP flood keeps
its receive queue busy, re-add it, repeat, then run the selftest's
created/destroyed object check. Unpatched net-next leaked a peer and its
keypair 5 times in 2140 removals; with the patch, 0 times in another
2140.

Thanks,
Andrii
