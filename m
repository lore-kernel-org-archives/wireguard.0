Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494EDC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:21:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6b2f05c6;
	Thu, 21 Apr 2022 23:49:54 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 88874d48
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 10:45:12 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id s18so9322476ejr.0
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 03:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackwall-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wK3Vu/zllzq8WW1cGsouYUQlE32V/v7LYbuG4KARwww=;
 b=iWo3MuKhvQmURfId57Q9uVQNBSA37QsqxkHYuHTUlbM4DFyctAvxrqNB/IKdRzrNOD
 zJqUM34hZ268u8gA/eQsmhLSaeJqqFsEuoEerQ4HgjmrjgyRkWR+FbFn0QDRB9rtQId9
 JiKuZjBHR9Be84RkQ9KZm0tWSbz8uNDRMkEEU8VfjgNX5pYy7Uk9l6Dx4PhytkF5f+l6
 FQZVuwkpGSbnaIp37yQTI3jpdNRqxxq61/mIAQdMxhrgexjZPeOUZrArpb1p0HejOXtz
 IJLEFTlraweDr79RyAW072wL5wLxjB37KWYNPYSDbZJRp5McegC9XhxrRsyZAfCUb5vP
 AdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wK3Vu/zllzq8WW1cGsouYUQlE32V/v7LYbuG4KARwww=;
 b=uBQ2rNlskQeZZiM9G4WBm1HBjk9gHH+MciIDCXbjBpjBp5czUU+Qw4zKtfyPWE5l4/
 JmmmfbUpZLJ/o1cic8mM2rnePJNP9RsTUWgyg8DLKdjGVDSd/VEbNC9rQTPtKZYnjs6h
 3X/RQ5Kqd7qBcrxT+5Idju02+KBSVe6FVIhOpxDhUPYXEA06Q8cFTqIOI2iUyHsUaUku
 Ue+tOFeMqBQ6J4WRxXldHrBRP0uyZAB/aKGv8NZpMTgv7ZugbC9nEiOW0A3BYa5wLkG0
 VOaZtfUwEpRlZ4zAQkkUryVDWW4qKi9xo9eK+xqMsiSsuND/zR1o371/HP6Nc//R9ath
 fb1A==
X-Gm-Message-State: AOAM530vHyyq7PaZ9muNtfZbHeyCMRmh8AQofS22AlxiMMQU9ALSwgJl
 BApbQhc1jq4eYsDhW498bKry5A==
X-Google-Smtp-Source: ABdhPJw+lUQ4hQwaZcm0NYtAWY2TeyGXIOIdTleMr9lZonqxWXnefd5lDNruLr7zmdbdkrs7EzX8pQ==
X-Received: by 2002:a17:907:7205:b0:6e7:ee50:ea94 with SMTP id
 dr5-20020a170907720500b006e7ee50ea94mr1732651ejc.351.1649933111632; 
 Thu, 14 Apr 2022 03:45:11 -0700 (PDT)
Received: from debil.. (87-243-81-1.ip.btc-net.bg. [87.243.81.1])
 by smtp.gmail.com with ESMTPSA id
 hy24-20020a1709068a7800b006e888dbf1d6sm504984ejc.91.2022.04.14.03.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 03:45:11 -0700 (PDT)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: netdev@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>, Martynas Pumputis <m@lambda.lt>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 kuba@kernel.org, davem@davemloft.net,
 Nikolay Aleksandrov <razor@blackwall.org>
Subject: [PATCH net 0/2] wireguard: device: fix metadata_dst xmit null pointer
 dereference
Date: Thu, 14 Apr 2022 13:44:56 +0300
Message-Id: <20220414104458.3097244-1-razor@blackwall.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:49:50 +0000
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
Patch 01 fixes a null pointer dereference in wireguard's xmit path when
transmitting skbs with metadata_dst attached. Patch 02 adds a selftest for
that case using bpf_skb_set_tunnel_key on wg device's egress path.

Thanks,
 Nik

Nikolay Aleksandrov (2):
  wireguard: device: fix metadata_dst xmit null pointer dereference
  wireguard: selftests: add metadata_dst xmit selftest

 drivers/net/wireguard/device.c             |  3 +-
 tools/testing/selftests/wireguard/netns.sh | 63 ++++++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

-- 
2.35.1

