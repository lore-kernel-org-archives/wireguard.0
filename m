Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2F6C54E76
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 13:57:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 853da50c;
	Sun, 19 Nov 2023 13:35:26 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 87832eb8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Nov 2023 13:12:25 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c514cbbe7eso29241781fa.1
 for <wireguard@lists.zx2c4.com>; Fri, 03 Nov 2023 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699017144; x=1699621944; darn=lists.zx2c4.com;
 h=to:date:message-id:subject:mime-version:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GgcoN0KcfHcdUzBrfBdNQTxNtmJCU8xM2IHVzVFiawo=;
 b=NnDrGRpQJEEudS2NWqGalzwT43cwZe2NHlfEXPxQ0FAAiTjJ2fN65luEJh+0G3Wj6y
 mdON4ywJ3kUHRCPxy7GuszFYrFNerDf7cLbI6DLbKaKyfcQinIwn0mNz858yhwPrTGea
 4ptbpCq82qFm4Zrxw30yvL9bsDyqdQkVCojnFdr0UCptv4lt+RYt1fnfuPIvS2tPJqqb
 Zd8HKmU6Wc0/pxDxLIZAz8c0ofdqF0vkq+DioP3PqnPkHlyvFLRoaNrhccRmm2QSlkgs
 C7Jun+0AM2PgFyowchkfm/ILGJ4QIGPvUkGYE8ypx03APj/F3Rao6580CoyBWuClvZMB
 /y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699017144; x=1699621944;
 h=to:date:message-id:subject:mime-version:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GgcoN0KcfHcdUzBrfBdNQTxNtmJCU8xM2IHVzVFiawo=;
 b=kJzbC5f+k0ra5K5KNya4inyez9ko24sIun5aVBu2v5SmG+impeGWpkTiGSUNdGTFBg
 Jd+mlGrrpBoL5wfFTcHBupObmxUci7qk6TOFaLw3wOATRF7khXAOMTjrkNF0lND0D8km
 K1RYSDBtdtl366uxYn0G+0BaHX9qAoriac+7B3dfADvFDfMGABeE8LJ5FEmZMjTRZwRi
 Q8lj9sPHxDTecTioQ0kGnQDrWYWZca8cqYEfxx4GKCX6a29ns2AJWqW9iC7JVo96S61b
 2ycmmQjNOnmXxzbWIghWY+uDSiHw3satH3fUk3cMem0Z9SgnAJdyHKx4wH+Dk8LpPVrs
 k9pg==
X-Gm-Message-State: AOJu0Ywprj+xOJtmzOc9jMwbufRpy40mqWGnFDbI/Zz9eOyAGRKbYiE1
 Mza8b7tYrpSikH95J8zkYLwYOFaz160=
X-Google-Smtp-Source: AGHT+IEs7pumZMGzI60bLLsHdvVBjuF7avxv0crwHx45jBhQ1C9LaIOM2JanGzfHyP3vrda/Yl/0+g==
X-Received: by 2002:a05:651c:19a6:b0:2c5:1ad0:e2ff with SMTP id
 bx38-20020a05651c19a600b002c51ad0e2ffmr19935509ljb.39.1699017144384; 
 Fri, 03 Nov 2023 06:12:24 -0700 (PDT)
Received: from ?IPv6:2001:8a0:f9b0:6500:387d:8391:1687:e44?
 ([2001:8a0:f9b0:6500:387d:8391:1687:e44])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adff609000000b0032d8034724esm1816961wrp.94.2023.11.03.06.12.23
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Nov 2023 06:12:24 -0700 (PDT)
From: M P Robert <mprobert@gmail.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_E0FCBD3C-EC29-4A25-9E1E-DC3A016738B1"
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: wg-quick set_mtu_up - largest or smallest MTU?
Message-Id: <81DE093A-5905-49CA-A412-5F934E0E0EBB@gmail.com>
Date: Fri, 3 Nov 2023 13:12:22 +0000
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.104.21)
X-Mailman-Approved-At: Sun, 19 Nov 2023 13:35:24 +0000
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


--Apple-Mail=_E0FCBD3C-EC29-4A25-9E1E-DC3A016738B1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


I was looking at the auto MTU detection in wg-quick.

It appears that wg-quick is taking the LARGEST of all endpoint MTUs

=
https://github.com/WireGuard/wireguard-tools/blob/13f4ac4cb74b5a833fa7f825=
ba785b1e5774e84f/src/wg-quick/linux.bash#L134

In a scenario where you have different peers on different network =
devices or routes with different MTUs, I would think you would want to =
take the SMALLEST mtu from all peers in order to avoid having =
fragmentation talking to the peers on networks with smaller MTUs.

Or perhaps fragmentation for some peers is faster than selecting a =
smaller packet size for all peers?  Or I am missing something (more =
likely).  Happy to be educated on this point.

I don't have git-send-email setup at this point, but just in case this =
is a valid issue, I've attached a sample fix for set_mtu_up that will =
take the smallest of the discovered peer MTUs rather than the largest.  =
I'm not a bash guy, so just take it for illustration purposes.

Thanks!

-Matt



--Apple-Mail=_E0FCBD3C-EC29-4A25-9E1E-DC3A016738B1
Content-Disposition: attachment;
	filename=wg-quick.set_mtu_up.sh
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="wg-quick.set_mtu_up.sh"
Content-Transfer-Encoding: 7bit

set_mtu_up() {
	local mtu=0 mtufound=0 endpoint output
	if [[ -n $MTU ]]; then
		cmd ip link set mtu "$MTU" up dev "$INTERFACE"
		return
	fi
	while read -r _ endpoint; do
		[[ $endpoint =~ ^\[?([a-z0-9:.]+)\]?:[0-9]+$ ]] || continue
		output="$(ip route get "${BASH_REMATCH[1]}" || true)"
		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ( $mtufound -eq 0 || ${BASH_REMATCH[1]} -lt $mtu ) ]] && mtu="${BASH_REMATCH[1]}" && mtufound=1
	done < <(wg show "$INTERFACE" endpoints)
	if [[ $mtufound -eq 0 ]]; then
		read -r output < <(ip route show default || true) || true
		[[ $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ]] && mtu="${BASH_REMATCH[1]}" && mtufound=1
	fi
	[[ $mtufound -eq 1 ]] || mtu=1500
	cmd ip link set mtu $(( mtu - 80 )) up dev "$INTERFACE"
}
--Apple-Mail=_E0FCBD3C-EC29-4A25-9E1E-DC3A016738B1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii




--Apple-Mail=_E0FCBD3C-EC29-4A25-9E1E-DC3A016738B1--
