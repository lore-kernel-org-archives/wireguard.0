Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72089CA6009
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ac1eb7e6;
	Mon, 5 Oct 2026 07:00:27 +0000 (UTC)
Received: from outbound.ms.icloud.com (ms-2003f-snip6-11.eps.apple.com
 [2a01:b747:3002:201::33])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 41951c2d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Aug 2026 05:57:15 +0000 (UTC)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-3a-60-percent-7 (Postfix) with ESMTPS id
 0FB8E1800132
 for <wireguard@lists.zx2c4.com>; Mon, 10 Aug 2026 05:57:12 +0000 (UTC)
X-ICL-RepId: 019fea3f-1eb9-7c08-a516-b2dba64c5088
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPC0MAWBxJC1YCWwZLVxQEC1weXlIKRnkRUAFYHlZeWhdeTVEPDxlaFFwYU0VRH1RYQQ4KWhIYXBRcUFgeRhJWDV0JGQZBXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcDNghJA1t1XB9GDDp1QAMudkkUQQsoBEZxQAFPBlUELwY0DEhzBFQHXQVdVlACWlUSBEAIVlBeCF4fTBw=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai;
 t=1786341434; x=1788933434; bh=5tWJUJG6SnYBuBZeZZq8cJ7glHx18gRawtEfzjWMsRI=;
 h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To:x-icloud-hme;
 b=uMELOFNp2ZR0vhiN7HCFfwddPDMa+8Iebg1kys2Pu6zQdOQonkgKiYjc3KTXkN4zrvW2F8E0WumCiNWGUwuZatl3y5ILYuQIuTtQ850cp9PVRkPH3I9FuGxrMgARCm2DFbdsdmU843HOeAqqY+rxxKWn3kSyRKIm7oqNC6nwRXxR0yYFcKDy+ZeiEaqbUC1OEam1kqsynsBUG2P8bHH7Msz+FCeJ/rLdazJ1dYvmcWgZkJFEBfGlTyONLq8G9rJa/IcGttJpvSg1i4/V+pKw37Qq3mE5AQyNELuAYm2D9dov7ml1dff3mL9nBk8qDJPTdTWvbR1kwwkWCRyoWhbM8Q==
Received: from smtpclient.apple (unknown [17.57.154.37])
 by p00-icloudmta-asmtp-us-west-3a-60-percent-7 (Postfix) with ESMTPSA id
 0FC5C1800124
 for <wireguard@lists.zx2c4.com>; Mon, 10 Aug 2026 05:57:12 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
From: =?utf-8?B?2LPZhNi32KfZhiDYudio2K/Yp9mE2YTZhw==?= <sosi986@icloud.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 10 Aug 2026 08:56:58 +0300
Subject: Re: [PATCH] Revert "dns-hatchet: apply resolv.conf's selinux context
 to new resolv.conf"
Message-Id: <1F1106B7-65BF-4ED9-98E3-C087583D4D50@icloud.com>
To: wireguard@lists.zx2c4.com
X-Mailer: iPhone Mail (23F84)
X-Authority-Info-Out: v=2.4 cv=LpmfC3dc c=1 sm=1 tr=0 ts=6a796839
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=x7bEGLp0ZPQA:10 a=c7deE8RKVNQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=HyzYxv5D6p1NO4_E8OwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ROYgSd5tctZUgDZX9vBHio_Bdg5w5EV-
X-Proofpoint-ORIG-GUID: ROYgSd5tctZUgDZX9vBHio_Bdg5w5EV-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA0OCBTYWx0ZWRfXx+GKe4hO/3A5
 MATkB6/VxAAApgxLUDQtCZOGWUd6hW0pfLaqtEEqXIVKd5nGbV3EF6zJex0gbECzyHMWsAXlkEL
 mGWEBhyZs/qIeVYtHWJ7Q5rLpFars2bz89fWBUaZScyyMpRD1WgsLZpO86uqZRp5MnzWsgknyj9
 hOF1YZ7sn0xZJ774xz+jC/VP7H+x/n1xQV4kmGXxZk5Vv9zqhdDS2gPEvn/wsqceMenG8yO1Wl5
 8LFlvwE4Pa0h9lC0IBkLrdkIIaGWbGl/4/xJZSdr/Y/Hk3wpb+nlohsTq8OZSH10VG8aJf4LDvU
 u/qFen6HduqSZdHAxxxcZt0wYNbNsZI1FcjaJvovZ8oWkKzkjMF1FLnMWoNVEw=
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

DQrigKvYo9mP2LHYs9mE2Kog2YXZhiDYp9mE2YAgaVBob25l4oCs
