Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29F3606A31C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yB93919K
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id cb1b0c53;
	Tue, 10 Nov 2026 18:00:43 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id de159474
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 18:00:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-c4d427836e9so308081366b.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 10:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794333637; x=1794938437; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9LuItXp5s8cFtxPZ9H5FlDtsQK3I8Ay0nxSYFMAUyVk=;
 b=yB93919KJzV3nYg2P9l5iJ4nCLAQvQd2Gvw1paTWLDph9kjW6pSJk8Q0by/Zyo9Pfv
 e8HpJ8uU0sg+TSSMQMR5KdTzAhmsnEaCAEoNCsuLpPdT3gk6t1fjnN2yJPvXx3XR6LQP
 vIH3BuOLsSZFVsMi9aEuo7PACP41gBj2GsdEUJ/nwtOSiuZ/dBqwrmu28xIFF9X+ESMP
 5Pd7jBNmZv3nH4ISrnzoztfTV0JnjQghwOKAUnqXPpmtXMcoaYqMXJPTXYgbM8OqqEvD
 keY4U87Sx0UG0FP7eIqK9t9+uwvECmM83TsNuoAak3isehwsjs8s/4CJiRMtfeFnC8TG
 4Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794333637; x=1794938437;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9LuItXp5s8cFtxPZ9H5FlDtsQK3I8Ay0nxSYFMAUyVk=;
 b=d7VJjj6aFRuM3vle6cXD7gwqpeGVucxzBhormRYkz2N907BCEmvAzJc15mQCUJEpBt
 Xcvyt4BDukIOvj7Mozag4w9x7mapF1Z6z+Ejo7PCX6J12LaqJ+rpNB/OcZp0r871u7NM
 aS7PHKjzcx8TAb5EWwcuDJvYIwV3emsanjZkwC6t+XhbGiX2IJYgfX5+1X52nHdIDVBG
 fSzR6XBnrEQUiX2vaS8xfAgimgsq69dF/bwsqIWwmudftX6nJ7bCLHlpF5oMnEq43S0o
 O0Y3Va6uWmderNN33P9X3JhWitc73rzVz/DWGAqQn8E1mvoP7UdAK/layW0+JCLm7wdy
 b8Ng==
X-Forwarded-Encrypted: i=1;
 AL+hErFf4ZzyFY+Sb+rP6iOMWtd5VlT9Z1k+lUEoSC9YyEVn1hHNb2nBiAmQFdqtkKdCc72/SdLRHWKbDZc=@lists.zx2c4.com
X-Gm-Message-State: APuU4Z8nbPGJW6uqpmg8M8AKiTAH5SOHO5kSZ2DPbUrG/P0ehc6HfjxI
 z2JWCuym/eCTCRDVcwL9CPc9YDxaNj1ORc0nmJNJOYM10NaFExC7z3Gh
X-Gm-Gg: AYBFou3A21mPfF6gNx2miu+P9yM/hsMW3DZqLKDRJugSJ6gqLoppJFM7LybmMcNQaAb
 3JBEzr9MH/YFHRAzIk1PNbG/bERsJQjDaXANiPzjjVrZwuUZQ8EeLvwHKmQ5Q44GOW5SHNq0fcW
 13nwAA6x9Lpf8sn85kU63UdTHynIRHvK5kuebWhHS4Zu4v7kS4D+8q4DwonDP5dUDoNLlY9Ttvb
 LlsMn5CE6OV0q4AsbVSsB9eg9akbB/5Tj0WYdIdLnE6aT6Fa9h+cCWb+Wd1D2J68zc1Tt+kZrdP
 cJM5uX/RK86dToZ7R2b1WHUyHo2h4IZ+1LgJ0Z3/YCgPWIipcj4fayYhjMaUzc87vCh0fjIKcC4
 x5D7OLpF9SQzL9sal7LMZfLBQN4h6GuB86VKOCkYkrfTneaUjLZoezxjYR5u2e2L7ZyHPycN0ch
 XdfEi1H8OP9lsbWA5wWZ2XyWbCDR0Vl64ID95hBJ7YAQbWh7H9puubF47jkwBzkUTJWPpKw3B5u
 ePUTu2sYDYUfKCL+BEdkqliVP1dvU6YZdJNLqRchufsEEOKkmwRZ/R25To13wmNd08MlrgiTjEg
 4CHCpFqW7JF4okgH6mUGFzcmBCUHBvwkYBVwi7dj9D8sAhNU
X-Received: by 2002:a17:906:830c:b0:c42:102f:15df with SMTP id
 a640c23a62f3a-c504951eb29mr193190866b.8.1794333636284; 
 Tue, 10 Nov 2026 10:00:36 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a59fd2csm141668066b.44.2026.11.10.10.00.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Nov 2026 10:00:35 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: netdev@vger.kernel.org, wireguard@lists.zx2c4.com,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] wireguard: peer: free packets left on the per-peer
 queues on removal
Date: Tue, 10 Nov 2026 20:00:34 +0200
Message-ID: <20261110180034.76136-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avNIS67grg_Qc5Vy@zx2c4.com>
References: <20261003201625.4572-1-apasichnik9@gmail.com>
 <avNIS67grg_Qc5Vy@zx2c4.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 05:37:31PM +0100, Jason A. Donenfeld wrote:
> I'd be interested in seeing your adjustment to netns.sh so that I can
> test this myself and validate various approaches. Do you have something
> really minimal? Also, is this a test case that could be implemented
> minimally enough that we could integrate this into netns.sh permanently?

Here is a minimal version. It relies on the created/destroyed object
check netns.sh already does at the end:

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index a8f550aec..8303802c0 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -207,6 +207,20 @@ n0 iptables -F INPUT
 ip1 link set wg0 mtu $orig_mtu
 ip2 link set wg0 mtu $orig_mtu
 
+# Remove a peer while a UDP flood keeps its receive queue busy, then re-add it;
+# packets left on the per-peer queues would keep it from being destroyed,
+# which the created/destroyed check at the end catches.
+for ((i = 0; i < 10; ++i)); do
+	n1 iperf3 -s -1 -B 192.168.241.1 &
+	pids=( $! ); waitiperf $netns1 $!
+	n2 iperf3 -Z -t 2 -b 0 -u -l 64 -P 4 -c 192.168.241.1 >/dev/null 2>&1 &
+	pids+=( $! ); sleep 1
+	n1 wg set wg0 peer "$pub2" remove
+	kill "${pids[@]}" 2>/dev/null || true; wait "${pids[@]}" || true
+	n1 wg set wg0 peer "$pub2" preshared-key <(echo "$psk") allowed-ips 192.168.241.2/32,fd00::2/128 endpoint 127.0.0.1:2
+	n1 ping -c 1 -W 1 192.168.241.2
+done
+
 # Test using IPv4 that roaming works
 ip0 -4 addr del 127.0.0.1/8 dev lo
 ip0 -4 addr add 127.212.121.99/8 dev lo
diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index 368fd9d60..c69a408a5 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -67,7 +67,7 @@ CONFIG_SYSCTL=y
 CONFIG_SYSFS=y
 CONFIG_TMPFS=y
 CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
-CONFIG_LOG_BUF_SHIFT=18
+CONFIG_LOG_BUF_SHIFT=20
 CONFIG_PRINTK_TIME=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_LEGACY_VSYSCALL_NONE=y

Two details matter:

- The ping after the re-add. Without it the re-added peer has no
  session while the other side keeps using the old keypair, so nothing
  flows until the next handshake and only the first removal happens
  under load. My original reproducer had this flaw, so the "5 in 2140"
  in the commit message undercounts: most of those removals were idle.

- The log buffer. With message_cost=0 each removal under load logs up
  to ~1000 "Packet has unallowed src IP" lines, which overflow the
  default 256 KB buffer; the object check then reports false "merely
  destroyed" errors and can miss real leaks. 1 MB is enough for 10
  iterations. Without the kernel.config change, 2 iterations fit in the
  default buffer, but caught the leak in only 2 of 6 runs.

Results on net-next 66974df65a0b, x86 KVM:

  unpatched, 1 vCPU:  failed in all 3 runs; 25-40% of loaded removals
                      leak a peer and its keypair
  unpatched, 2 vCPUs: failed (1 run)
  unpatched, 4 vCPUs: passed (1 run)
  patched, 1 and 4 vCPUs: passed; 0 leaks in 212 loaded removals,
                      including a 200-iteration run

A leak shows as "Error: wg0: Peer N: merely created" plus a matching
"Keypair M: merely created". One gotcha when switching NR_CPUS: the
qemu Makefile does not regenerate the kernel .config, so delete
build/<arch>/kernel/.config first.

So yes, I think it can go into netns.sh permanently: 10 iterations add
about 13 seconds and caught the bug on every 1-vCPU run of an unpatched
kernel. I can send it as a separate patch, or fold it into a v2 of the
fix, whichever you prefer.

Thanks,
Andrii
