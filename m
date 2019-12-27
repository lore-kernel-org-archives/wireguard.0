Return-Path: <SRS0=Ew3a=2R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700C2C2D0C6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Dec 2019 14:45:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 563F020740
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Dec 2019 14:45:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="T5pbkLQu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 563F020740
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8213927c;
	Fri, 27 Dec 2019 14:45:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4ce4ff4
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 14:45:20 +0000 (UTC)
Received: from netz.smurf.noris.de (dispatch.smurf.noris.de
 [IPv6:2001:780:107:b::b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbc2238e
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Dec 2019 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Te7hAart7kgcw7Dtxehu5nteXgxUvy9zdY2VpHOq7LA=; b=T5pbkLQuHYPRHgM3MhwTAh+WcY
 sXGYyhXAhiUR5a1gIAGq3qDTDVo/ywB4ZAF7BgIAF5QNW3tI2idppCtgFew3Jk2Ia/3vz7jDB8L9i
 cGz1zM4CN4QedwrpTOIEZv7SnPlZ6rhWa3kngO/D89Ago7ypXjDPj37F182Hle95SGdV5mxbAQMsG
 KbFLHdwHUhPa2VAReaBVSN3sbroB2ilQYpOe53cGz+8IoLYn05UhKXESCVIsaYVP0AsafWIZlKBUu
 qkAfWWg0LX93vqRHqD/KuiLXcD5YJtoUcuA5xjaMprq6/Om6RNrco1LGeNJTMVkUkLYhvOAmrLMB7
 0mnB6T+MUpVJg2TDa+l9BCwPcv/2L7kEyFsengTrChOSLVT65HuB3JHqF9U2EvWfn7pRmICaczv0M
 zyPMn37Ln/4kus7mgw834VguiER5/CIp60ZkBdg4M5YZ7SAs8KTDKDwZMC/YvoUzLUD0gnjkgMCNY
 NUuAkGABhXo0mbaJ0HbwOo7r260EJ7zp7isBXicT96h+dq9fwHNATsgT6efFmCdfvhrOGH/B/Qx8r
 OyjGEqDT0Odp05SMckAGSqjv8gr7AGgI93wSotJDlBKEmTY9q2k774MujC/khoQt6N7cz0R60qUdP
 HHcBjRW6VoODXl7LSmRYA+G5DKNl/7carJ/SzsnqA=;
Received: from [2001:780:107:2::a] by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <matthias@urlichs.de>) id 1ikqrR-000Bls-0R
 for wireguard@lists.zx2c4.com; Fri, 27 Dec 2019 15:45:05 +0100
Subject: Re: bad udp cksum messages in tcpdump for wg0
To: wireguard@lists.zx2c4.com
References: <49-5dfcd100-9-66d44b80@213097787>
From: Matthias Urlichs <matthias@urlichs.de>
Openpgp: preference=signencrypt
Autocrypt: addr=matthias@urlichs.de; prefer-encrypt=mutual; keydata=
 mQINBE7uOWcBEADgsF3N8L9mUekI0XLfLNQpMLq9VMwi8nyZtmJECHOajfOX8tMWua1Bh4qh
 1XAY9cKsaHTd2Ik88I5pczS2HKIXq7d6Tusqwlh/8AwUw6i0Zo4zEG6QJemWKhatJK28C92G
 zIVQp8hHOIDU1nQ5jeNKGsYufTThey324Lp5kQcEnd9Qd07fXJtxReGHIT24j05jwbp0Sevr
 95sYShzSjGxwGNYff1oAhIrlfpTXFcVng/S33SktFIDHaGJf0FgCVCllhohFc7Ei5DKB+4cY
 e1iz4aydp9wiOCkxxMGRGUkTtpUI8Q6+RPl9Md48dKZAen1HxEOaY1S4DgAISFJoN2dgzeVS
 tcfQHe1fkGfX1TgDd8/wXTcjImj3JubDjD36He+sW9vkiEzh9jt+YfDoNiRslMXXCiMHOcTa
 FPHADf6tNxBQfI63dTVOLy03K5MqKz96joc9ULVXX01S2Cxr9v7JsThMsmTcfvMH8Frf2EtF
 E8J1o/69vNJa7Lowur4kuwzXSViUYK+dEEcpuBDx3c5z2F2XW2Fu7pghqMIHjCI/WS4HcOSz
 5wPvOI4Wsa+6hoFo4QMXGawh6qP1qzQ/UGPwKfry8CX7KQWVu2eszkaj8d6Hu8ZWYEkaFgeL
 539INuiRmj5tvUXEFWu12+b1NmxIBbIcwuF1/DYwy1keFiHSPQARAQABtDZNYXR0aGlhcyBV
 cmxpY2hzIChwcmltYXJ5IGVtYWlsKSA8bWF0dGhpYXNAdXJsaWNocy5kZT6JAlgEEwECAEIC
 GwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAhkBFiEEr9eXgvO67AILKKGfcs+OXiW0wpMF
 AlyacMwFCRcSOOUACgkQcs+OXiW0wpMa7w//QvBN3+j3IMfsKcUrJxP44T6ar+80y7V2mgna
 o+FABbCVXJD4eNy3luRZDIzhJ34zqIOJ7Za5PwgVJiQukmbGlhLO10sYUyA+lDdilWQJoNj5
 /Cp8HA4PngPVA+cM8gcbGI7QFo96hzwZxHrHfT2kS833T8QNhyg/sq5ovgRsx1Ai8KwX0IGX
 kBAPvfHZkHeUgoj4obF2WwoKFJo3tkEClqoYel5YGddkdvhkRCqp5EZOswwMXQzxPSZ2BBj/
 zcyEWMc6544ESit+ITeCgknpplX7o27/SjkEuwgnlD6Nj7PcQDxTPFBjp8jRWsHtNLp1WynK
 J6DL6YOiiln4ZrejrKHplxHPTB8Byhli0O/YkwxaUy8DkLYC9bI6DbdN1O6MXQY1s42prur/
 KW//BjejjSd3nKGsWYAlAk6qNjz+VgqfX0zpClOPGOwRqpBy4H9IDnY/zpQj6pPohAooIQWD
 0wd469OJcru7ZJMM7fopNz/9LsFZuFhlbFRNKulvG32A9jburcbY2aphyOpMfuGqryhh/PhL
 xjR8ty07TU/9a3zaoi7SIr58ZO/AQ824Hs27uciG1DfS4eOtTtgJHG2Qlv7yC5X7B6wwZpbp
 5+MP4xxzTqeiQ5iCiU/6DnWNpb1dG/zbGgX6WwEhf6hkKFxgaHi+E8USwHA/eXXjwXTgXcG5
 Ag0EXJpw/gEQANEaoCjMJT7ow6wzCbqdrad7dTM10n55tcFzk2/ZMY3eziFOWvtx3j4KKcmW
 uHpmmQIg9kOl0CIOf123Hq6Y7ZZMYny4iodv7mGunY+g3hLBGHsQqLffEfFK2TIoXkkcGBVT
 g6QgNBqG1P7e5fgGqpLIT4gehtWu6j6+Eq/bhBEb/+9UAyjxCMpJciNPXx5G/mRqpAVmHt1O
 feHw01pXproUpt5/EbfaVGJG59Q5PgImGb8lP7cSNf8VAbCMvwd7VAPVJa8LbkqD1Dmj5n+0
 9eewumPoqHF5UhSCTTZAAYFGoUEwP3pmzrpZK3kL9fAg3QwIOTYg42QKpVbWakNVgKba7XgS
 fl4dQzIIIyRtzwwkKQT/Z7PJL6JDx0rjiy1yaz4z4N1faqDFD0dwBIDb+DtwwnENrTJ3051U
 TxLporWDgofep3RDPyb8IcjjNKa2HXqztWQf55pga/WfeQSlUvOqGGZhLLgVGdhsZlMbV4Z3
 s5oTW8lku+PQ43zigAkXXQRR+hzHRS1T7FQHa3M69L+8GNqTrdQ2b8C72EKTYyQLVoRzZ6OM
 ZDwK+svHCKvmDCV79w5NEdR+ZS1OA95taliAGvq0X0gv7ToDhZpBUHxq/aza0Gy+GuLGC3z0
 B9CLJe7VmckAF2dUY8YuQ1gGaor5aVXdgqzXbYFu86OxClwXABEBAAGJBHIEGAEKACYWIQSv
 15eC87rsAgsooZ9yz45eJbTCkwUCXJpw/gIbAgUJCWYBgAJACRByz45eJbTCk8F0IAQZAQoA
 HRYhBDcxnBC/BGMXoUQ4Cfhssmx2wcFlBQJcmnD+AAoJEPhssmx2wcFlQaQP/A7kLpVFn32c
 zIPlF+CehSVF3D/BewGU/ubTlYKzA61F1eJiFOlYLZT9oNIvUDvRqkB/9/pZy2Ua2rDGe66N
 2f1Or9E2Qqea+sIyCHdHs8WRbhEzBvHQbblLAWRTP+WxwMf4leRD1vbpW/ezNvwK+pItzNrW
 V/ePwYtKoSRXf30yovO5haDgF8NdLp0ckAHP4/DdojjDPWcbWSssyPjCL9ZG0g52bU9NMDkT
 XGqfuPqYL7tPffeyaMNv8YPB36tKgsf8hRtWl/BxBtGyeJUDpy8pFcqbt7F00P+1+6ypcYam
 gPaS/f/ubSGQ8MYBIN0wEalbJAMKCMFVa8kvcxbWOstMzDui4b3E/bBuBF47YGaeZ2T5ntVY
 VodiIBWw+jGf4V6/pym0Hv2aGi1bvJDEM4xABCF5PsRxk78vO7cpjxrTxSonjdfHriej+Z/b
 WjB/2KWXcsWgHFv1ciODunAeQjVb0VWi/ID+3UJ1QzYNIlW+w83hCmsjlMrHizRsPs7PkHZ3
 EsI7BK8hfhAc/Af7O77rOxwomah9tmLTfKyRynxUbpJB42Nw4he+hUbUuUzBiMUTvX2yVELD
 25ysV7PahAexuRUmTOzWYk31BHpEclraEF/tvdYj2DGbXNixEJqzh2YEtguUMk1CVty+aB5c
 viCwDZ0gCH2Gp9wIfYlJbDzgb/wQANQQzZU4KDhgYsZhhvL7gXpAOLBIO9jH6WVSzMhjh3Hq
 X0t1b2KZ309StKDuiNBJt3vr5HKx2Zkb14P2SCeRQPRUK+7lpsGAHix9iUryJuG4bOGq6kuT
 TMwbRiu+cIYOf0GyadG2bHuisF+AJbSx924uL10xjJwz5+rAne+FNYIaCXHl6sJO7PzAt2TU
 /6NezSmKY8QGX1zbn3Nx+yIJvpGDmsZJ47K2tP3EX8wZnu9YIPybcnwtOPeSgS7v0fOe3UCc
 q08Csyet57SUpnIcrr8ltniLe4rLDiHqxTU5NHuIrhkKQ7tkZV/vxcsPgwbZhZnDjnjJaV/d
 64p3WvXo+A9OGYaGlXou/ob7Ihas+c5Pg+7pk44v+86Rdil+wfwU3m4p0JriTQhKV1ZzQbOx
 2Utjyie/LPcPZ9Q/KWxn7OxwT+P2IsiP6L+cPXHXVDjmkel2Z41X039oj5xfOjS9B3G3aubB
 PkGwOy7ycm0YZMoglJerkTn7dR+NHTRgfr0ZsadwkSSHVq/gpMVNTxz31/LBjyTUzvcVfrg2
 tQ8eOtRULu6CB+5Iwt5g9cJla2mZZ77AXKpPLMZL1lpXejyIxJa2s41/iGngUd+mNBnDdEXy
 epDFkwUtQACg6Pw9hGg3OmmNVnyrWbiA7UJSG8N0AARZg2cg1LE/lcuTbeNA6c0WuQINBFya
 cRoBEADBZ2T4aR8A/YmsKchvLvnhKhLBVE8S9WNuVchLymp0T3T6PC7ZzWZ1Jn82KLRGt3dH
 zLmajAReZg1oOfkjOU1MuwsSVhrfB54fYFCVYpYb2cmlUx6L1H30M24sx576pPaZZDdgAu2P
 fSzK5aRYyjqW2N7bT2NOcuJ6h8lTawav5hhw3iecrLrekgWh4RmdXDqiPpIOmYav6tu0cPoi
 fWF9t7fVqnobNPFEVOkVLHHCSKkRsRfgsrI+DihX3pU8IeLjdk7uUQ4Lj/YENIFC1aWFFgU3
 OltN0Zn96WLaH9nHSOKhsGwIj6urzOLW2y84Y041ngwlHVJvDzXmYJ4QvSkAhtYLuuvvldgO
 7kNOEpD1gx2lqeLZ6iqnRzxci25xZlZoWuJ7fFULKnVFQa8577jEumHyka213Gdx2OTrGyDe
 X9nhzn/0CcCJiECgy9h9izpRJ5+NS1O8le/VJpQcyq1v0U7mKUYD8j8CMB6tH19RD2xWzM8o
 J17vbLiZwjwWRs4fgCek+9NvbfisRzqRXT+ud3wrTbd0O6DnAoOBjRn1L64caMfP38mXPZ1H
 oYFAf7LC74BUqvNSwOr0Wouret56LeAqGDlGRLKPTXRXdR3fcBaa+zKkofOtZfomh2cqhZ2+
 iswWBI4sHCXB/S1dNoIlg1DbWGYpPU1vAP1c65uRXwARAQABiQI8BBgBCgAmFiEEr9eXgvO6
 7AILKKGfcs+OXiW0wpMFAlyacRoCGwwFCQlmAYAACgkQcs+OXiW0wpM7QBAAr4iOpLE1Mqkk
 sq5Rxf7RPYD+veTFoSV0ZEX7SdlPgRq3XZ5H1qKhuodmKN+oupq0g2QTfB3hzmpONeWuU0/L
 U8y+hlETMa1YuG2Usowqtu8fPjJzwPUOGvWuijJtkUpuNgBkFJMVWM+dRbDJ11/KIikFBsBg
 Ef3h9rtQaTwOuHM5VYwQ++xaDdvgVb6yvOLbrHSnzySR6R9Cgy+APR8okigHcGRgi0GpvWel
 4tOd9sXzFGKR340zpB+yUpbqSwYvEN5+8fpckHTi+4s12zPUncDYG4l7S9fhR/fEZf69GIfv
 K3RHr9/ocxLq4XTcvi6B8Jae08ZekplbuNaYRUxe13ma0zMJ/wGiAdkueeOvy71M05QE0cKq
 TE1brteGooWC4Tg2QF+ItvntyVlz+NHjm8FKgril1VPzwgv+vw85yXJrgNhwzDaKiJX4AGIV
 Qqfp9kRyIugHX/ld0E4tObuNZyQdDYLcBALJyz1FE+p3rLbRRVI4rjdgu3WB9qI9T09q6t9L
 L2fxPK+cqOQvhqtYwI33EKhzgUa7mEqnJcxEU23crbL92LQ+UtT3fEkf/I3O1WyYjAUvoYKS
 kYP4aXv7R9rMFnCm79FeUSYJse3ew4C1Ug0GZZJXDTJqf6sQbGdpQuKN/SLIWPjDWyMWsNkX
 fsVEzkSD5BLOh2EZ7CyO5+Y=
Message-ID: <b9511f60-672c-2b5b-d6aa-893dfd87954b@urlichs.de>
Date: Fri, 27 Dec 2019 15:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <49-5dfcd100-9-66d44b80@213097787>
Content-Language: en-US
X-Smurf-Spam-Score: 0.0 (/)
X-Smurf-Whitelist: +relay_from_hosts
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

Hi,
> ethtool -K wg0 tx off rx off
>
> I want to know if the behavior described above with the checksum
> errors is to be expected? Or is it necessary to turn those checks off
> on all the interfaces?

Yeah. I need that too, on one of my routers. Apparently some checksum
offloading hardware gets confused by wireguard.

Interestingly, on that machine fixing this problem requires turning off
checksumming on the wg interface _or_ on the hardware interface, either
way is sufficient.

-- 
-- Matthias Urlichs


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
