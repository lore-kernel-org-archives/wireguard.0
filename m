Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A479606A325
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zpb2OdBP
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 99dd7fd7;
	Tue, 10 Nov 2026 19:03:17 +0000 (UTC)
Received: from mail-dy1-x1335.google.com (mail-dy1-x1335.google.com
 [2607:f8b0:4864:20::1335])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d4c8a865
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 19:03:13 +0000 (UTC)
Received: by mail-dy1-x1335.google.com with SMTP id
 5a478bee46e88-37628596783so813783eec.1
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 11:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794337391; x=1794942191; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6RkAQIspQaoLMKc6MhHzmQ1y9Vc3CHra4Dm81lXBmAk=;
 b=Zpb2OdBPu9J9ZBcZR7eOzgxWpksvudS5xfnDdVvBxOgql32kuwyhXwUp34SldYUmXX
 /D+iazuB966m2H0WcAxbeZ6mNNnOSV/Pc7rbauw8zWaCOe811gERnYKV8YL8iIWsmaom
 QT9NSVGuqRzvZRHO7xBuNyToWk4rA3nr6pzp7aqEeX2g1dICxesP0frNxKn4/6TImXws
 bKBYPWHRFMXWqHuiRtGwG/CKUZRRQr/5QYP8uYnuQ2SpO1A2jQbwsualuAHhqfDXVTNJ
 4HdoEbZs2z+l6hqIWnaEMpcPSC1oWidzGwLz1TjYhB5f097pOd1vaj0YgJEEqoK6lOXG
 nCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794337391; x=1794942191;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6RkAQIspQaoLMKc6MhHzmQ1y9Vc3CHra4Dm81lXBmAk=;
 b=j3aGTVUHO7npIu+O/Jd1trw8H1uvIA0n3iaAjbz6uhdI1H2F+F3JCslT/Z9LyfM3Vv
 K5xq6s2Hmlx8gxQp663ALvVzv15gUTu+A6GEpbHfSSZNihdV7/LEvyfMLRVdi/VdgwpE
 7XlB3+/uhY4DvoTfKn63IZk2XpFICG9DDPn5rlDEqmEBZZgRsIKqy0BzDv6sfgbhZpy0
 zgCTmtvBd002doWSIzTwJ9dC4+jswyamZ4hWfgKjijFmmyjuFHjV8SE6N9AvZ+kjNOGB
 gn2gcWLXiWmpgBurUmK8UTMuMYCSSTP1oFDTrxmFpVaXQ8tOj52fL2P3ypJBF8bKPir+
 C1TA==
X-Gm-Message-State: APuU4Z8y7jIVVV2VQLUwSpXesBESZyMhbQe1WT9vAqgp5DRKWXJBqJrK
 tpBTKH4TlpKdkz+YjfkRflyDibYn+h+2/SQJ73p2s5lwDPRkjEHeU64vY744fP5N
X-Gm-Gg: AYBFou3ktZb6tqz13HG74KHMnb9LdbwSRKyGku+tZriaa9c57GT9E+1+k6k5Amc6M9N
 dhcum10a/TXnmmOSptf8Hq7zsA06pY7FY0C+OMOZ/c3GZMpzGslExvNXZ9S6rsErst5alVGzHJN
 tJdqLiqS6FFewLITl68lvwYHWVtBQC4dlbiRqu/24paK8LxE55laG0YMlGQxK2tv23DRLTXoGCB
 XRaKdrWTUUmns/n2eIdS+P8tD0nhK7mFMHVZd++zKOzArIqzBAgpQtO9ZNbU224Mzr48Li8b4hr
 Z1pbXaBW7Mz1CKltCEOHyzWGZk5MCEF7FadKMNPclrFldTF+P9xO1Ztdt57QtCSmFMPiPco9jid
 LngVb2m9+f42X71gRxbDBdPKqEWC2YOvRRl9q7Zi+xdP5V8x8jGwGq/pyhMxJhoQHCTfbDf/5k9
 QjX/Z3jJLWWKJLMVE2wkT5R3c+fkia3igjl90ZyeaSlbsRBQ7NuDIeP0xbzgrz80FhWVL6or6U9
 N2GuS3WMbwVlKIdwj9CqVnKfVeTz8ggWnRKp9ebXMQmWtfASKYaGVpCoBmaabJezrGp87WJNf+1
 5S4Pa2v4YvOUZuxNIM5T66h6vf+TralRnzKB4dpM5zp7cTl9Msp/W4gJmO1cAXyu2Tvu1A4PhgF
 ANpJuglgehUjQNmHovexRnENZwuCHU1b3TWirWLVtD85pKFHHNMrZgalmsHo=
X-Received: by 2002:a05:693c:66d7:20b0:36d:f004:ae6e with SMTP id
 5a478bee46e88-376865635ebmr253880eec.34.1794337391147; 
 Tue, 10 Nov 2026 11:03:11 -0800 (PST)
Received: from fruitbat.pteropodidae.net (ip70-191-36-30.oc.oc.cox.net.
 [70.191.36.30]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-375215d8889sm9269658eec.27.2026.11.10.11.03.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Nov 2026 11:03:10 -0800 (PST)
From: Loren McQuade <loren.mcquade@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: therealgraysky@proton.me
Subject: [wireguard-apple] iOS 27: tunnel stalls on cellular until toggled;
 handshake initiations go unanswered
Date: Tue, 10 Nov 2026 11:03:05 -0800
Message-ID: <20261110190305.33155-1-loren.mcquade@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This is related to John Audia's report of repeated path updates on
iOS 27 [1] and his patch that drops the keepalive sent after each
rebind [2], but it is about a different symptom: the tunnel stops
passing traffic. I don't know the root cause, so this is a set of
observations plus a workaround, not a diagnosis.

SUMMARY

While driving on cellular, the tunnel intermittently stops passing
traffic. The app keeps sending handshake initiations every 5 seconds and
none is answered. Switching the tunnel off and on fixes it right away (a
handshake response arrives within a few seconds of toggling). The log
shows a satisfied path the whole time.

ENVIRONMENT

- iPhone 15 Pro (iPhone16,1), iOS 27.0 (24A437). I have only observed
  this on iOS 27, so I can't say whether older iOS behaves the same.
- Official App Store build 1.0.16 (27) for the first stalls; later ones
  from a local build of the same source plus the patches mentioned
  below.
- Peer is a pfSense router running WireGuard, with a persistent keepalive
  of 25s on the server side. The tunnel has On-Demand rules.
- The endpoint hostname resolves to IPv4 only. I removed its AAAA record
  to rule out a dual-stack problem, and the stalls continued.

WHAT THE LOG SHOWS

Stock 1.0.16 (27), a stall that began before the log window and lasted
until I toggled the tunnel (times are local; the peer is shortened):

  18:10:01 peer - Sending handshake initiation
  18:10:06 peer - Sending handshake initiation
  18:10:11 peer - Sending handshake initiation
  18:10:16 peer - Handshake did not complete after 5 seconds, retrying
  ...
  18:10:29 [APP] startDeactivation (I toggled the tunnel off and on)
  18:10:32 [APP] status changed to 'connected'
  18:10:34 peer - Received handshake response

The same log has the path updates John describes: "Network change
detected" 191 times in 23 minutes, almost always with interface order
[pdp_ip0, pdp_ip0, utun5], most of them 2 to 4 seconds apart.

His keepalive finding explains one oddity in my log. Of the 89 "did not
complete" messages, 86 say "try 2". As far as I can tell from the
source, during a stall the keypair is either expired or due for a rekey,
so the keepalive sent after each rebind ends up in
SendHandshakeInitiation(false) (via SendStagedPackets or
keepKeyFreshSending), which resets handshakeAttempts to 0. So the retry
count never climbs and the "giving up" path is never reached. That
explains the shape of the log, not why the initiations go unanswered.

The same-port rebinds on every path update did not clear any stall that
I could identify as one. One stall of about two minutes cleared on its
own.

WHAT I TRIED

I patched the app to count the backend's "Handshake did not complete"
messages since the peer was last heard from, and to restart the backend
(new device, fresh DNS) after four in a row, about 20 seconds in. Over
five stalls (with three variants of the trigger) the restart was followed
by a handshake response within 0.1s four times, and about 10s later once:

  08:07:19 peer - Receiving keepalive packet
  08:08:03 peer - Sending handshake initiation
  08:08:09 peer - Handshake did not complete after 5 seconds, retrying
  08:08:14 peer - Handshake did not complete after 5 seconds, retrying
  08:08:19 peer - Handshake did not complete after 5 seconds, retrying
  08:08:24 peer - Handshake did not complete after 5 seconds, retrying
  08:08:24 Handshakes are going unanswered; restarting backend
  08:08:24 peer - Received handshake response   (79 ms later)
  08:08:24 peer - Receiving keepalive packet

I also tried rebinding to a new source port (UAPI listen_port=0) instead
of a full restart, in two stalls. It was followed by a handshake within
1.4s once, and made no difference for 46s the other time, after which a
restart was needed. So a stuck source port is at most part of the story.

Some events were real outages that a restart can't fix: in one,
handshakes went unanswered for about 18s before iOS reported the path as
unsatisfied (the first failed send, "sendto: network is unreachable", came
just before that report), and traffic resumed when iOS reported it online
again. My patch correctly did nothing there.

WHAT I DON'T KNOW

- The root cause. A restart works more often than not, which points at
  state in the backend or socket that survives a rebind but not a
  restart, but I haven't found it.
- Whether John's patch changes this. I haven't run it yet; I can run it
  together with my workaround and report back.
- Whether this is specific to iOS 27, to my carrier, or to my router.

THE WORKAROUND

It is a small change in WireGuardAdapter.swift (about 70 lines, iOS
only), with a self-contained HandshakeStallDetector type so the decision
logic can be tested without UIKit or the log. The adapter maps the
backend's log lines to its two events, so it depends on the wording of
messages in wireguard-go's timers.go and receive.go. I would not want to
merge that as is. If you'd prefer a different shape, such as exposing the
handshake attempt count from wireguard-go, I'd rather do that. I'll send
it as an RFC if useful. It is complementary to John's patch: his cuts
the work done on each path update, mine recovers when handshakes stop
being answered.

The two fixes needed to build and launch on the iOS 27 SDK at all are in
"[PATCH 0/2] iOS 27 build and launch fixes" [3], with John's Tested-by.

I can send fuller logs (the app keeps about 2000 lines, roughly 20
minutes) if they would help. I have removed addresses from the excerpts
above.

[1] https://lists.zx2c4.com/pipermail/wireguard/2026-October/009758.html
[2] https://lists.zx2c4.com/pipermail/wireguard/2026-October/009760.html
[3] https://lists.zx2c4.com/pipermail/wireguard/2026-October/009755.html

Thanks,
Loren
