Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2D3C10F00
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:34:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BA77222A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="cz5VYoTP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BA77222A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db741b57;
	Sun, 17 Feb 2019 01:26:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52d89d4b
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Feb 2019 17:54:34 +0000 (UTC)
Received: from st43p00im-zteg10072001.me.com (st43p00im-zteg10072001.me.com
 [17.58.63.167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 637fddf9
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Feb 2019 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=04042017; t=1550167348;
 bh=IIPEr5Oncg0QgkYNDZvdyI72/Z4fKtTe32DMORwNFCI=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
 b=cz5VYoTP/64b4Z3r7zE/cLT/0nXL3dK9R8a9Igy3xf3oXf5RvJaA72CBzyDgUG+hw
 ZlpN6p6BYyBOQr9AzOEi03w6MeuT0xOtPe1FczOIKXQ2bCX9j8GT2H8zTFC507U1E9
 6GJbNiDqUA/QNACPtHN1M4mkmzeUkrL0BJUQlG5+j5W4ygJ5oCQ1vK/t+NnJgATfKb
 9CIHC55HikLbuMyh1fvzoP47i8EKCaCQNwxAqJyLjVQ4jppBZcCMqrMhvDKOn2h9KJ
 fOEaTkcmiEIjHcpoSYZUJ/W/8aXT9KIYMEpoCRackeomPe7L+EUAfkAPh0xOgy3mzd
 kAIFCgrZXfWgQ==
Received: from [192.168.1.2] (unknown [83.97.18.60])
 by st43p00im-zteg10072001.me.com (Postfix) with ESMTPSA id 0D4446E01DC
 for <wireguard@lists.zx2c4.com>; Thu, 14 Feb 2019 18:02:27 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Lee Yates <rainmakerraw@icloud.com>
Openpgp: preference=signencrypt
Autocrypt: addr=rainmakerraw@icloud.com; keydata=
 mQENBFtSPGIBCACA1E2BjKjTOrhm43bkGwdwJHlgP04pimOFX3RrcA6YIg36mXvkCu8+q8we
 cTreZxGxVehb1VyQPkypI3k8UcfXWYm2t1uxGkiM/kCnUKsqBwJZXLxPM9erPIENwIf1hICc
 sPjEuMq2nIhYV8kfCOgwZKnbezy7kZ24edbVldz3dMniqiEeipkXWUr8y2UomYreGosFsLEN
 yj8RPFqYzCpvlFU9rT9wU5/+nwHtX1ySCmniR3MXurAWm6mAAJU9g/0dv5Ua8BCvvR/dadz4
 RGA7CmvOYL8qcn5A5djFMOqNqIp9IQOn9XNHR6+W8JzVwTpaz8xkbO/yr2kjhxn9uU5BABEB
 AAG0I0xlZSBZYXRlcyA8cmFpbm1ha2VycmF3QGljbG91ZC5jb20+iQE/BBABCAApAhsDAhkB
 FiEExF+G9PyiAB1cKHnz7yXLzDsoqZIFAlwOpFAFCQKdm24ACgkQ7yXLzDsoqZLrxgf+LqIL
 Gu44ncKX8JNlASClX0edBz8dW1OxevG7Wv3fYFlBAFU8eNbUEYol0n/BJscTYcXu2SgJcP4T
 f3u/ZLOOUKmTkG9sBKwZyRq7dNjhpT3qUfm97VBUldBQQsziyAbEFnFP8V+nK/N20pFrFUO5
 bNckeIp8vLUtWE3jXwhXdhy1Ynwac0nAQOZk/RBapHfDE0F9WWUWv4BxangkE3mcL1J0VEqQ
 p/aaqV2MgO7paaN5eIFjqd6akZV6ibtv3E1Ly6wHPZjraAFkoKr92QmfxREQ52fP7HTKsFZk
 pi9AvxkL/eQJZsLTAg61Hail3OwHoNMvF8YawAY475DUT0ZDJbkBDQRbUjxkAQgAgEetirjP
 rK6Jd/XvXugGNAYE7TBSKkdzCEHkDpI+4RuooXSyk4vgCuYh42ophEMPuVBkja9kFnn0vCed
 2lt8TLC6lupCgifVfQe7VQeJ0N8qke25jk+k5ozkWuVap+PPVt4u6yItE2aO7Bqwl1p15v1J
 YJcr2LtPwEkCmIISpkcWgdWgj2QTwRjrKiJ3n6OxUDDdQiwNO2k9l4epuh0NfCghcfosN2K4
 YFZkGCoPMA07ByJfV8hFBxPGHBUeI990Q7bwb4q0+ktt91vOTkN0EzxDbYYwfAmDsida8HoV
 SLZFQuPZ4Sk6U64lSdQE1czzJ8dLPyT8yONHDeyEtLKIPQARAQABiQE8BBgBCAAmAhsMFiEE
 xF+G9PyiAB1cKHnz7yXLzDsoqZIFAlwOpFAFCQKdm2wACgkQ7yXLzDsoqZJ+iQf/SY4HLXwH
 cf+Q7gs9IVIg8gArmgYwYKRKUMYqK/sZdDtKDB352dQAnpmdzXvZX1EOdzaA8Lv8yoMMVhpg
 UZa1vza0vA5hhYIzBEBuJDcYUzYKUL4JTR5RuV9IYcpB8K22u9zmin8bOE8fod3/zDovI7+b
 B7oZ0W0hz3eLUqTRA2+zNcnTlQuk5i0ckmofTYYazzpoQSHz9HEJ1c92zcyewUYYJNcIUr/y
 Zec+/b/AdaBXO2XaNL4nNcHnwzEcdXiLysIg7mZNl6N6+wE6zGhnDZ1/Kv3b1rATpFE7UqyZ
 lKbeh15KM/iQFviKk4VjnqrX0sKsbzRvAk68dsLOkGLOgA==
Subject: Logical cores / SMT with WireGuard
Message-ID: <735c8b20-c92b-2403-1557-32187b130a8f@icloud.com>
Date: Thu, 14 Feb 2019 18:02:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
Content-Language: en-GB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-14_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1902140123
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:26:10 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256


Hi everyone,

I have a small form-factor Dell Optiplex 7010 (Core i7 3700, 8GB DDR3,
128GB SSD) with a quad port Intel Pro 1000PT NIC, running Arch Linux, as
my edge router. It covers two local subnets (trusted LAN, and
DMZ/servers/IoT), with the trusted LAN clients all being routed out via
an AzireVPN WireGuard tunnel on WAN. It works great for this and 15
minute load averages are in the order of 0.1!

My question is about multithreading/SMT on that Core i7. At the moment I
have it enabled, and WireGuard seems to simmer nicely across all 8
threads. However, with the known Intel security issues and
recommendations to disable HT, I got to wondering how much - if at all -
disabling HT would impact on WireGuard's real world performance. I mean,
it obviously can utilise logical cores/threads, but is there a real
world throughput benefit vs just using the real cores?

While my router is overkill anyway (about 18% to 20% usage under full
network load with 4c8t), I obviously still want to run it in the most
efficient way possible. Is WireGuard making real use of those logical
cores/threads? Or will it run just as well on 4 'real' cores as on 4
cores and 4 HT threads?

I know the obvious answer is to test it out, but the router runs
headless and is awkward to get a monitor to so I can access the BIOS. I
did try for a short time when I first set it up, and aside from CPU
usage going up (because of having half the available 'resources' with HT
disabled) nothing seemed to change. My WAN is 'only' 400Mbps anyway so
hardly a taxing test. Because of this, I can't really learn about how
much WireGuard benefits from the extra threads, if it does at all, as
either way I have headroom to spare for my current WAN provision.

So, technically speaking, is WireGuard able/programmed to take
demonstrable real world advantage of logical SMT/HT threads; or is more
real cores the only proper way to scale performance with it?

Cheers,

Lee Yates
-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEExF+G9PyiAB1cKHnz7yXLzDsoqZIFAlxlrS0ACgkQ7yXLzDso
qZJROwf/b76RT+dFoo88KU36UJYRifluCBQ8TMfmj0DbWSQuyvQouJFqovYtt18/
UHSL/6KTgcHEkGFSaIQqAyP3xT7VjWjFhqyaOmBM1oAQ3HuVzmxnwkE4vumnhmHF
CrkIHcLNG/8jT1Xddd5q9rVcABqgGqOjT8lyF83id3MCPWj2njxBczQvILXq7i21
jvkzfnpEA94qG5IdV2xtGBQbtLwbHIu+ek7ayVj+NbyjLfv708wvMhUAf/1pQHew
WKBqv4tENMbKgrARhhS4YYHOo4nl14iRHQTDSm7a27xMdaDUW+M6+EtY+/citllx
OH0s5SYkkUClWRLCsooXJipfVWkw1A==
=Is7v
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
