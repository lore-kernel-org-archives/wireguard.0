Return-Path: <SRS0=hP/g=5B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2212DC10DCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 00:20:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC8F205ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 00:20:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=opal.com header.i=@opal.com header.b="uXeZSZjX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CC8F205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=opal.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6095f795;
	Mon, 16 Mar 2020 00:13:45 +0000 (UTC)
Received: from mail.opal.com (tunnel103479-pt.tunnel.tserv4.nyc4.ipv6.he.net
 [2001:470:1f06:113d::2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3be3a6ed
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Mar 2020 13:11:07 +0000 (UTC)
Received: from localhost (vpn-2.opal.com [IPv6:2001:470:8cb8:4:0:0:0:2])
 (authenticated bits=0)
 by mail.opal.com (8.15.2/8.15.2) with ESMTPSA id 02FDH2CR018489
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
 for <wireguard@lists.zx2c4.com>; Sun, 15 Mar 2020 09:17:03 -0400 (EDT)
 (envelope-from wgrd@opal.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opal.com; s=mail;
 t=1584278224; bh=hM8W8sxFeSKNeFUI7SnHUSGH0Y2vr8DgKjHk4YitxyE=;
 h=Date:From:To:Subject;
 b=uXeZSZjXwu3vBJIP9t8J+tViUbBliG4HjIHGsrNK8aKMrm1hb2Iu0AxGgKDvxTVLf
 P8qL8EhhmZE8WAul5s5lYOeZUHlf4tW9bUbUcC8TAGoxgCGsNqNn8z7F4sliCeBrkO
 DE0Ij6gkVoQKugP3xPAqIHBuM6eEw9FwKT5emexI=
Date: Sun, 15 Mar 2020 14:16:59 +0100
From: "J.R. Oldroyd" <wgrd@opal.com>
To: wireguard@lists.zx2c4.com
Subject: Logging
Message-ID: <20200315141659.771e0088@opal.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; amd64-portbld-freebsd12.0)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.opal.com [IPv6:2001:470:8cb8:2:0:0:0:1]);
 Sun, 15 Mar 2020 09:17:04 -0400 (EDT)
X-Mailman-Approved-At: Mon, 16 Mar 2020 01:13:43 +0100
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

Hi all,

New here.  Apologies if I am re-hashing something discussed before.
I did read back a few months of this list and didn't see any relevant
discussion.

Unlike many here who are providing anonymous VPN services and who
don't want logging at all, I am helping set up Wireguard in a corporate
VPN environment.  The logging requirements here are very different.

Specifically, there is a need for permanent logs.  And, the logs should
ideally include:

	- when a client connects
	- when a client disconnects
	- ideally also how much data was transferred in and out
	  during a session

So this is precisely the opposite logging requirement from those
who are managing anonymous VPNs.  That's understood, and my proposed
changes maintain current default no-logging behavior for those that
need no logging.

I have made replacements [1] for device/logger.go that allow syslog
to be used for logging if available.

There are two files, both are needed.  There are OS-dependent
compilation directives so that the syslog version is not used on
Windows or Plan9, which do not have syslog.

In both, the behavior is exactly the same as now by default.  If no
other config is used, logging is still at info level to stdout as is
current practice.  I.e., you can drop these in and nothing will change
for current users, even on systems that support syslog.

To use the new syslog logging, environment variables must be set.
Logging level and logging destination are controlled by the existing
variable LOG_LEVEL and the new WG_LOG_DEST and WG_LOG_FACILITY:

	LOG_LEVEL	"debug", "info", "error", "silent"
				(default is still "info")

	WG_LOG_DEST	"stdout", "syslog"
				(default is "stdout")

	WG_LOG_FACILITY
			any syslog facility, e.g., "daemon", "local0",
			"local1", etc (also "log_", prefix OK and
			either lower- or upper-case)
				(default is "daemon")

Note that when using syslog, your syslog.conf needs to be configured
to send messages from your chosen facility.level to somewhere useful.

Also, it's worth saying that wireguard-go's logging includes some
UTF-8 characters.  Certain OSs' syslogd don't handle 8-bit data
very well.  E.g., FreeBSD.  A patch for FreeBSD's syslogd is at [2].

Since this is backwards compatible, it would be great to see this
logger.go and logger_syslog.go replace the current logger.go.

I have also been playing with some patches to add the session start and
end log messages.  I realize that this is a stateless protocol and that
the idea of a session isn't really there.  While my current placement of
these session log messages in receive.go and in timers.go is close, it
isn't perfect.  Right now I am logging "session start" in the initial
handshake code and "session end" in the handshake timeout code.  Neither
are perfect but, as I said, close.  I need to look more at the peer
state information that is currently maintained in order to see if
there's a better place to put these log messages.  I realize also that
these session log messages must not be logged for those who don't want
any logging.  These session log patches are NOT part of the current
proposed logger.go changes.  If anyone wants to see these, I'll send
them along separately.

	-jr

[1] optional syslog logging for wireguard-go
    http://opal.com/jr/wireguard/logger.go
    http://opal.com/jr/wireguard/logger_syslog.go
	(both files are needed)

[2] Patch for FreeBSD's syslogd to support UTF-8 chars in messages
    https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=244226
