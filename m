Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A946DC61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Feb 2023 08:09:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae93028f;
	Thu, 9 Feb 2023 08:06:14 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b40c671
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Feb 2023 08:06:12 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id fi26so1396473edb.7
 for <wireguard@lists.zx2c4.com>; Thu, 09 Feb 2023 00:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=a0H4ubimJut0fhVsOImuanX8rgXyMnSQMflkZ0u/ris=;
 b=dnRhd+coQTa7ntFLSPqVI1S42aIjsLQiaU8VT0lxHCpfUdqguoyq7LzR5WgzQpdEEY
 6uyJx7fxt85UuVn0k8+Yaw0/lUlH0QStteSj4R/YblF7jLHBO4kO/a4LJ2tz3InMZyBr
 zc2Rmsy9WLaF7b7eRFl6Aju3yodstBMGlJY37HlxTdEI4Sve2/eKnTv9PsP/wq4te99x
 agpc8N+IX8UaHkYKpGL2fEw1VbhloCxeh0fmXt06GFVTbSMRn16MRf1wGl6DOltOFnTo
 uUn8C+J/qlIsDtgJMk/rMAzY+0VwVb/LLDBAIIgB25ENBeJ8y4CDXtDU1ryCIXrM4/zY
 noOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a0H4ubimJut0fhVsOImuanX8rgXyMnSQMflkZ0u/ris=;
 b=t0/ILSPZvo4VSbYpV/PMemaCyExf7uu2ZK5R1KkyuiGwoyy9aei4nW82mAhoQHTw10
 osCu894qLYtrN1kM/mfT68CSFSQQTKy2d+gRsB3lnZMx9PEQBslO2Gd6Oxes9gWlA3fX
 xALCk8PKg8cB40+yrX2jIAohvPMCqSZQcxEBHSffXnscORiA63A0q5msHTE1yZ/v0f20
 hGV/VhxLMeQn2BGUK9MSRzXaSNUCLA46DKIqdu3yGOSnyoF/d9n9gtl+oyd2kFi9E7qC
 TsZLeIJ2oSmZk5bVlwlbSxM8K8csT8Bk59hbVcFYexe8M3M+SSalZq4nQIJJZv4CaLYG
 ZtMA==
X-Gm-Message-State: AO0yUKXdbpv4dWNEPgyYnNuzkioq6xHWr8ArRszeJBLssgfdBWQ0q41s
 B3ZJo6qx6mcaW5mqL3AZ4DJ5h2xG4h/48RxRIXJyPq7t88tbPQ==
X-Google-Smtp-Source: AK7set+T9BbQt1QtTnPanTauBFQqplHTnSvG2VxFvpj7o8BVT27VVymSicaY34/TvETqvUaVcqKDI2hxmKlDcEDtiiY=
X-Received: by 2002:a50:871a:0:b0:4ab:1c69:5cb with SMTP id
 i26-20020a50871a000000b004ab1c6905cbmr221165edb.63.1675929971695; Thu, 09 Feb
 2023 00:06:11 -0800 (PST)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Thu, 9 Feb 2023 08:05:35 +0000
Message-ID: <CABBZOsmDgrG_4zZ3WRxhjjfKZBwvzW_f=v3sZ6UKoNTpSsHMhA@mail.gmail.com>
Subject: Compiling Wireguard-Android repo on a M1 Silicon Mac
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

I have difficulties compiling the Wireguard-Android repo on a M1 Silicon Mac.

I got this error message below. Any idea what I need to do? Thanks

* What went wrong:
Execution failed for task ':tunnel:buildCMakeDebug[arm64-v8a]'.
> com.android.ide.common.process.ProcessException: ninja: Entering directory `/Users/houmie/Projects/wireguard-android/tunnel/.cxx/Debug/2w2e1e1x/arm64-v8a'
  [1/18] Building C object CMakeFiles/libwg-quick.so.dir/ndk-compat/compat.c.o
  [2/18] Building C object
CMakeFiles/libwg-quick.so.dir/wireguard-tools/src/wg-quick/android.c.o
  [3/18] Linking C executable
/Users/houmie/Projects/wireguard-android/tunnel/build/intermediates/cxx/Debug/2w2e1e1x/obj/arm64-v8a/libwg-quick.so
  [4/18] Building wireguard-go
  FAILED: CMakeFiles/libwg-go.so
/Users/houmie/Projects/wireguard-android/tunnel/.cxx/Debug/2w2e1e1x/arm64-v8a/CMakeFiles/libwg-go.so
  cd /Users/houmie/Projects/wireguard-android/tunnel/tools/libwg-go &&
make ANDROID_ARCH_NAME=arm64
ANDROID_C_COMPILER=/Users/houmie/Library/Android/sdk/ndk/21.4.7075529/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang
ANDROID_TOOLCHAIN_ROOT=/Users/houmie/Library/Android/sdk/ndk/21.4.7075529/toolchains/llvm/prebuilt/darwin-x86_64
ANDROID_LLVM_TRIPLE=aarch64-none-linux-android21 ANDROID_SYSROOT=
ANDROID_PACKAGE_NAME=com.wireguard.android.debug
GRADLE_USER_HOME=/Users/houmie/.gradle "CFLAGS=-g -DANDROID
-fdata-sections -ffunction-sections -funwind-tables
-fstack-protector-strong -no-canonical-prefixes -D_FORTIFY_SOURCE=2
-Wformat -Werror=format-security  -Wno-unused-command-line-argument"
"LDFLAGS=-Wl,--exclude-libs,libgcc.a -Wl,--exclude-libs,libgcc_real.a
-Wl,--exclude-libs,libatomic.a -static-libstdc++ -Wl,--build-id
-Wl,--fatal-warnings -Wl,--no-undefined -Qunused-arguments
-fuse-ld=gold" DESTDIR=/Users/houmie/Projects/wireguard-android/tunnel/build/intermediates/cxx/Debug/2w2e1e1x/obj/arm64-v8a
BUILDDIR=/Users/houmie/Projects/wireguard-android/tunnel/build/intermediates/cxx/Debug/2w2e1e1x/obj/arm64-v8a/../generated-src
  mkdir -p "/Users/houmie/.gradle/caches/golang/"
  flock "/Users/houmie/.gradle/caches/golang/go1.18.2.darwin-arm64.tar.gz.lock"
-c ' \
  [ -f "/Users/houmie/.gradle/caches/golang/go1.18.2.darwin-arm64.tar.gz"
] && exit 0; \
  curl -o "/Users/houmie/.gradle/caches/golang/go1.18.2.darwin-arm64.tar.gz.tmp"
"https://dl.google.com/go/go1.18.2.darwin-arm64.tar.gz" && \
  echo "6c7df9a2405f09aa9bab55c93c9c4ce41d3e58127d626bc1825ba5d0a0045d5c
 /Users/houmie/.gradle/caches/golang/go1.18.2.darwin-arm64.tar.gz.tmp"
| sha256sum -c && \
  mv "/Users/houmie/.gradle/caches/golang/go1.18.2.darwin-arm64.tar.gz.tmp"
"/Users/houmie/.gradle/caches/golang/go1.18.2.darwin-arm64.tar.gz"'
    % Total    % Received % Xferd  Average Speed   Time    Time
Time  Current
                                   Dload  Upload   Total   Spent    Left  Speed
100  131M  100  131M    0     0  17.0M      0  0:00:07  0:00:07 --:--:-- 20.0M
  zsh:1: command not found: sha256sum
  make: *** [/Users/houmie/.gradle/caches/golang/go1.18.2.darwin-arm64.tar.gz]
Error 127
  ninja: build stopped: subcommand failed.

  C++ build system [build] failed while executing:
      /Users/houmie/Library/Android/sdk/cmake/3.22.1/bin/ninja \
        -C \
        /Users/houmie/Projects/wireguard-android/tunnel/.cxx/Debug/2w2e1e1x/arm64-v8a
\
        libwg-quick.so \
        libwg.so
    from /Users/houmie/Projects/wireguard-android/tunnel

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
