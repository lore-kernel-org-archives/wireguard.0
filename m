Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FC1606A31B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linke.cx header.i=@linke.cx header.a=rsa-sha256 header.s=dkim header.b=kknQSrYl
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7d4bad5b;
	Mon, 26 Oct 2026 05:29:11 +0000 (UTC)
Received: from mail.linke.cx (mail.linke.cx [49.13.16.253])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4904aa9b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Oct 2026 08:21:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B1AD53F68C
 for <wireguard@lists.zx2c4.com>; Fri, 23 Oct 2026 10:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linke.cx; s=dkim;
 t=1792743661; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=y79PP5V8GkDp3DCVgfDvBjXeFK664QWDNxt4dFrDyQI=;
 b=kknQSrYlmlA9vw3ErJVpUKt+KG4iax+vJOT2LLp0WGHeyQ/Lc5nadXvtISuZ47ucvr3Nuy
 mxzM+9fnI3oAbgpCNbAbVnkQW2boCw/BOtu1NBIMSvI+YDA0uFvdRVZy34W1as8Y0hvTN+
 mSp0kQr6FstlH1GB5p5xCpKw1ayqQaDaLk5mBRo8WYntGXK4AkOvtBmPEqt2Zwy0BMrvwn
 LwCoiNf0N3nSfsOJmUi0P13q2YlxKYzKiwbtRDpPsfYS6iEXWICd9y490Y0EawJ/a3cZmb
 eODp8lUEhujnWlyp22hVPKdwjnP2QVX/+VXfCuJba6DdPMxAKbgjmbSZJ5VUsQ==
Message-ID: <9cf60cbe-a574-4e0b-8cb1-cc44a9b870a9@linke.cx>
Date: Fri, 23 Oct 2026 10:21:00 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wireguard@lists.zx2c4.com
References: <CADk5WnMBrMLL4mfc4z7ibs8APkJMKcwQH3hEMkyK_CZ2rEk1Sw@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: darwin: debounce networksetup DNS calls to
 prevent cascade storms
Content-Language: en-US
From: Jakob Linke <jakob@linke.cx>
In-Reply-To: <CADk5WnMBrMLL4mfc4z7ibs8APkJMKcwQH3hEMkyK_CZ2rEk1Sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Mon, 26 Oct 2026 05:28:33 +0000
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I hit the same storm independently. In my case it didn't need a
feedback loop to start, application traffic alone was enough.

Setup: Mac mini (Apple M6), macOS 27.0 (26A425), wireguard-tools
1.0.20260223 with wireguard-go, split tunnel (AllowedIPs is a single
/24), DNS = 1.1.1.1, uplink over Wi-Fi, no IPv6 default route on the
LAN.

Trigger: on a host without an IPv6 route, a UDP connect() to an IPv6
address emits RTM_MISS on the routing socket. Chrome's host resolver
does exactly that for its IPv6 reachability check (a UDP connect to
2001:4860:4860::8888, re-run at most once per second). I saw about
one RTM_MISS per second while Chrome ran a benchmark. monitor_daemon
reacts to every RTM_* message: each miss runs set_dns() right away
and again 2 seconds later via SIGALRM. With four network services,
that's 16 networksetup writes per event, with unchanged values.

Minimal reproducer, no browser involved (host without IPv6 route,
interface up with a DNS= line):

   python3 -c 'import socket, time
   for _ in range(30):
       s = socket.socket(socket.AF_INET6, socket.SOCK_DGRAM)
       try: s.connect(("2001:4860:4860::8888", 53))
       except OSError: pass
       s.close(); time.sleep(1)'

CPU over those 30 seconds (one sample), in % of one core, with the
idle baseline from just before in parentheses:

   airportd 86 (19), WiFiAgent 22 (5), locationd 22 (0),
   storagekitd 14 (0), opendirectoryd 12 (0), configd 11 (0)

The same injection with the DNS= line removed: airportd 0.7%, and no
networksetup processes observed.

Practical impact: this showed up as a benchmark regression. The same
Chromium binary scored 62.5 on Speedometer 3 with the DNS= line
active and 65.0-65.4 without it, about 4-5%.

Regarding the fix, one gap remains for this trigger: the monitor still
reacts to every routing message, including RTM_MISS, which only
reports a failed lookup and doesn't change the routing table. Since
ordinary applications can produce these about once per second,
wg-quick would still run networksetup on every miss, just to read
the settings instead of writing them. I haven't measured whether
those reads are costly on their own, but ignoring such lookup-only
messages may be worth considering.

Thanks,
Jakob

