Return-Path: <SRS0=hP/g=5B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CDCC10DCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 00:23:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18790205ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 00:23:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Tl4dZ5nJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18790205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3aa33528;
	Mon, 16 Mar 2020 00:14:28 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0719832d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Mar 2020 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1584215777;
 bh=yz26wVJ7fd4RoSQ/F1G14Gavtnr6KjjfpNaBvpGwjxw=;
 h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To;
 b=Tl4dZ5nJwu3h4+c54xnBL6uvVBfySKEus5HS0Elrp67/1h0TIy58q7Nm/14iAnd+W
 6IQv1dyHA5CDbfGMH3QoszwRlsTCtMGjDzISl1DnxLp+k5BJNWcPgNPBiDQSHwM+B5
 Z1FrfoeRsp4W16hNmP0u10ezLZ55Huoogqhiysz8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gandalf.arda.local ([93.164.92.140]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MQMuR-1izmkK1K09-00MP9s
 for <wireguard@lists.zx2c4.com>; Sat, 14 Mar 2020 20:56:17 +0100
Date: Sat, 14 Mar 2020 20:56:16 +0100
From: Kent Friis <leeloored@gmx.com>
To: wireguard@lists.zx2c4.com
Subject: Re: WireGuard connecting hosts WAN->LAN
Message-Id: <20200314205616.5253f6439e8b76525d82539f@gmx.com>
In-Reply-To: <c3b5c2e5-d77b-1984-107d-6f6a56b67f84@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.31; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:rpiBGAsDXdPW3LKg0iz7dba9K8yZUjzUNLvhYDX8j9MNpsqYojY
 Ly1Nay7Wu1DBUxyVvzywOPd2OdRW3W1x9wEs1PzUE7Xc6TqlkR34iGvT544STOBMB287UVg
 o3T5RY84WChcI5ue6NUETrw8bu52OFZgNkE6ZcZijo8R2giz13SBywZLvXO89AJRWkML0Mv
 gdG0aG6UVd37KRjZHJEfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qRMcdjc1DA8=:ddTdzr0VFafKsqMDpV7eJw
 LccS8WqtxQA2+KZjCo4+1VBWMn4PF5fEhK8lazRrvWxzzLKyCKshg6KoNu3LNGIGtAg5zdDq/
 mKdL9NfJrV+Fi5oSgPc2i2fOB52l21AbR0J2mGr7e6EjKSHr3xIwPvlErlHaBi3a7C57FBLvx
 sWd1bysyazwzTvuZ2J/m5CV5Vfli9r2YyUyGLumfrxZPgTlngw69pKN7gqCD6HjdM3igjpiI4
 RjSgR+IgN6AKPc3MCdMakln+ucLu+6j4Fc2tjWNP7V4JRH1UVsOe+OWmLXCWiLev0Grc3+NY3
 iA4yYR0AdvNWsPi/nCSgsCwXmikjEnRBWz4L72R2z5kYbhKab8pTwI7o3EYMaqgthtwV/9LR5
 hXkDtEUMZo6FaNJ9Ik9KCY7J+Kv0wG9CumUaVunLikrXalEc3kcrN4e1y4a+O2LFJt8gVDfte
 vgpwm6KEB1HjkssnKUHSmudkzUe3ENVr8Q4pD6TqNRspljpcomNEPiFHnKWvmPGPtjK6dL8l1
 4NYspSWHt756oSSwXOgf0rH7+MC2cggL+YVtIZoLD90tYHLYuVFfk8MBlAXSmFAS0j/d4zD7l
 U2hqFLZAykQT8Vzu8WlMjBJ4TaahTn4t5NVV/jcyQI5kv+Y1dyNDyFLH5JwbFWtRafGcRjWwd
 eeeqpukp+pAh7AOlr80TKyXyVbC/7yvBevYCzJog6H7CLcK97Nu1DjmS19VCqXZXI+lN4ZtJH
 UtfwByTCcws3KhBV+EksoOUoMMg8Ekrg4ZJ0dNSgoyyMH4E+iUQucOK8x3lXlKEtP2JbXiYPV
 mH773C236gi/ysrLUmeSrWmO50k7ndvmiZKZysKN3+BKEgPuesj3fZvmnYF0/UJrAxlt0mJL+
 bfwlpnc96KXZxJOLLWLj4lVYLP8w+15lqN90VVad3S4BXnyQn1G++MNU2sb9JfXhMt5ju2p38
 /9psVOKv0vq0qxD8Spklh34ALqEzK+UhjhM9rv2//Jl//ugaTdPJu214va8AW91f0Ph7G9hUE
 6mxgY8uXGXLtCXq3BJETC8EZSa2XrQVqSrnuiFzKf4DAclqxwp2rpXBB7aIdALqvLbKJlQc/N
 rYuh4m/xGt2Lbr09iZyk8wpGd3X0NPjlnvPpCHD/KGjXHWcPO9WvyIyoILkkxMBEaOkoBCgFP
 3+6QWf3FxFSLNsHLzoDsBKw4dwq97//m3LQrjCagMFcoiUovzU7SvyPIPz0vlQtQ4Rk3v2w4f
 KwDhtjSkzLYsj3PF5
X-Mailman-Approved-At: Mon, 16 Mar 2020 01:14:22 +0100
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

> Scenario:
> A = internet (WAN) host (WireGuard IP 10.1.1.3)
> B = OpenWRT router (WireGuard IP 10.1.1.1)
> C = LAN host (WireGuard IP 10.1.1.2)

What you have been told is correct for the case of A connecting to C.
there is no way for A to reach the Wireguard port on C without B
forwarding that port.

However, if you can turn it around and have C connect to A, assuming
the wireguard port on A is accessible from the internet, C will be able
to connect to A. Once the connection is established, traffic will flow
both ways.
