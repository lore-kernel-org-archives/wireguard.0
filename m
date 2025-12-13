Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2392FEF06EB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 17:13:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adf92a67;
	Sun, 8 Feb 2026 17:10:32 +0000 (UTC)
Received: from outbound.ms.icloud.com
 (p-west3-cluster2-host12-snip4-5.eps.apple.com [57.103.74.98])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9f7327b5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Dec 2025 18:42:24 +0000 (UTC)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-3a-100-percent-3 (Postfix) with ESMTPS id
 C8CE91800304; Sat, 13 Dec 2025 18:42:21 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To:x-icloud-hme;
 b=V35NMJmIARI9XKVlocY02o5sfEniJWcbbS5Mfqq8iT3IOqyFEQmju0tAbA2AiIPt181AvDACAynDNgHBM7wdXI+2kdmHwzwTjhvJjqkjb+artd950QOzugvleIiwyno0TgKSW3S//OwZ7XekajzSifzK9Av5u90cUMXwzwzPn9O6O+V8Cf+6PtNqqU3V2/J8H6Fp/V4utnyOQ2Ir2NguvM+hXneVRL+6+8SGS+2K8O+hEwMQmUFZmGexk10uy2DmYBnVZ+/h3lZYi7haEF/l+ZyYopz2Rdj8e0f2llUnZG0dB6cwTYZg8CwewkLLI5vD+gErsuKZTChKbOZ99ff1RA==
Received: from smtpclient.apple (unknown [17.57.154.37])
 by p00-icloudmta-asmtp-us-west-3a-100-percent-3 (Postfix) with ESMTPSA id
 44CC61800316; Sat, 13 Dec 2025 18:42:19 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: caveeman.caveman.11@icloud.com
Mime-Version: 1.0 (1.0)
Date: Sat, 13 Dec 2025 19:42:09 +0100
Subject: Re: wg-quick: Separate files for interface and peer definitions?
Message-Id: <F3A97234-B50F-49EF-B734-D03A5A36CD66@icloud.com>
To: wireguard@lists.zx2c4.com
X-Mailer: iPhone Mail (23B5044l)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDE2NiBTYWx0ZWRfX8iahjKN3iPOz
 7cM/+K4m3ADH4S4w5FqxzlO0dewA4Z4LsM+CbJrzertjUkeo56g9yxJO6PTtpcvdOiM2hrrLWfp
 Hb4WA3jbglVf/92gGr8im5OMsr+weKMk5bq4fxizbAI9/r+IPHcEObId4WJd3CJ5BKcoAUMFw73
 jXuDrRNpy+s9TCOJUUJQ9S10OvSb4fxlr+PxODZYZK5j3zGzR637WeQxNcvfpeYW1nNnib4TWaN
 tYKIDqlcYoN/aHVQUPIm+9EPiJw6g1dYfrsT28PZFdwZeVBT8RUSJTW18KNgKQVDnqnO3UfZDaE
 92g7w0R8SWrTBhdih5X
X-Proofpoint-GUID: 7dTgZ-qXKfcjzhTmP1prVslq-VtTAmko
X-Proofpoint-ORIG-GUID: 7dTgZ-qXKfcjzhTmP1prVslq-VtTAmko
X-Authority-Info: v=2.4 cv=E93AZKdl c=1 sm=1 tr=0 ts=693db38e cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10
 a=x7bEGLp0ZPQA:10 a=Tb_nXx7jEfYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tclcd6dtLQvEqt9_mmAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-13_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=665 suspectscore=0
 mlxscore=0 spamscore=0 clxscore=1011 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130166
X-JNJ: AAAAAAABIHEjAWzCaRiC8PR/IdR2ZlmlVqHxBPGJUSzihSHfvI1CEligkyDPLghd+CoflOZOcCIX2i+I7l9de9seV0N9Aj4Jf5DlUZMUQsCeDb2dp6+QEkUreq0RfdRjSz8zYxVMVpf56Jjnlt6fPD+/VzagFo7ZriakmDEvqEb/OnTN0OqLArmGakXXQQXPqabzEf5b5JEJIoG19ElN0bbjMogUB+9HiU++EX1VYGyQHPZXvB3RRrI2upg7GmW7A4EOcjinhXzrdEu72io1oHPo+1x5dLZMDtmygG3D0IzdNT0Nd0Y3JgPHLICLldmTFJok1DM9U/hiK1K/7KLyhYvkDgLcTg9SbsuPzBH99H+2LRuv+RsMPHiX01CMwlQPbyqcksUcVnIR7ACev0bsGWITFK7JvPUxS+pcPDBJWylSlY8oKkcVQ65eivESw2O8SSOr8XeiCFSG4mcdH9Rp6qP4su15vUqJEDKB1jXcrFbWEuIXJLrRliXLA5yCxe9/ONDP+G5Sbn9+vEnJHHUwiblz+8gV9LM+oYkAbMOD9V2m6Wbs+qA40z5x7m34aKAn+o4h8h/aCWXq3Im8MJzmd26RaYp46ge9fG6VfQ==
X-Apple-Category-Label: MTgyNjkyODk1NDU6JGNhdGVnb3J5JF9QZXJzb25hbCw=
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:10:11 +0000
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


